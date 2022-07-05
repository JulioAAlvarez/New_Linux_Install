#!/bin/bash

ME="$(basename $BASH_SOURCE)"

RED='\033[0;31m'
LIGHTBLUE='\033[1;34'
NC='\033[0m' # No Color

if [[ $* == "-h" ]] || [[ $* == "--help" ]]; then
    echo "The ubuntu server base install script! By: @stautonico"
    echo "Extra flags:"
    echo "    --proxmox           Install 'qemu-guest-agent' if the server is a proxmox VM"
    echo "    --vmware            Install 'open-vm-tools' if the server is a vmware VM"
    echo "    --vmware-desktop    Install 'open-vm-tools-desktop' if the server is running Ubuntu desktop"
    echo "    -m, --monitor       Install extra monitoring tools (iftop, htop)"
    echo "    -z, --zsh           Install zsh and use as current user's primary shell"
    echo "    -zx --zsh-extra     Install extra zsh packages (powerline, fonts-powerline, syntax-highlighting) (requires -z/--zsh)"
    echo "    -9k  --power9k      Install the 'powerlevel-9k zsh theme (and enable)"
    echo "    -omz, --oh-my-zsh   Install oh-my-zsh and use as current user's primary shell (requires -z/--zsh)"
    echo "    --nginx             Install and enable nginx. Also apply appropriate firewall rules)"
    echo "    --mongodb           Install and enable mongodb"
    echo "    --mysql             Install and enable mysql (and start config tool)"
    echo "    -ws, --windscribe   Install windscribe vpn client"
    echo "    -h, --help          Display this help and exit"
    exit 0
fi

# Determine the flags before running anything (so we can quit just incase something won't work)
PROXMOX=false
VMWARE=false
VMWAREDESKTOP=false
MONITOR=false
ZSH=false
ZSHEXTRA=false
PL9K=false
OMZSH=false

MONGODB=false
WINDSCRIBE=false
NGINX=false
MYSQL=false

if  [[ $* == "--proxmox" ]]; then
    PROXMOX=true
fi

# Check if the vm is running on vmware (install open-vm-tools)
if  [[ $* == "--vmware" ]]; then
    VMWARE=true
fi

# Check if the vm is running on vmware (ubuntu desktop has a different agent) (install open-vm-tools-desktop)
if  [[ $* == "--vmware-desktop" ]]; then
    VMWAREDESKTOP=true
fi

if [[ $* == "-m" ]] || [[ $* == "--monitor" ]] ; then
    MONITOR=true
fi

if [[ $* == "-z" ]] || [[ $* == "--zsh" ]] ; then
    ZSH=true
fi

if [[ $* == "-zx" ]] || [[ $* == "--zsh-extra" ]]; then
    if [[ $ZSH == false ]]; then
        echo -e "$ME: ${LIGHTBLUE}-z/--zsh${NC} is ${RED}required${NC} when using -zx/--zsh-extra"
        exit
    fi
    ZSHEXTRA=true
fi

if [[ $* == "-9k" ]] || [[ $* == "--power9k" ]] ; then
    if [[ $ZSH == false ]]; then
        echo -e "$ME: ${LIGHTBLUE}-z/--zsh${NC} is ${RED}required${NC} when using -9k/--power9k"
        exit
    fi
    PL9K=true
fi 

if [[ $* == "-omz" ]] || [[ $* == "--oh-my-zsh" ]]; then
    if [[ $ZSH == false ]]; then
        echo -e "$ME: ${LIGHTBLUE}-z/--zsh${NC} is ${RED}required${NC} when using -omz/--oh-my-zsh"
        exit
    fi
    OMZSH=true
fi

if  [[ $* == "--nxinx" ]]; then
    NGINX=true
fi

if  [[ $* == "--mongodb" ]]; then
    MONGODB=true
fi

if  [[ $* == "--mysql" ]]; then
    MYSQL=true
fi

if [[ $* == "-ws" ]] || [[ $* == "--windscribe" ]]; then
    WINDSCRIBE=true
fi


# Updates
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y

# Install packages
sudo apt install ufw net-tools git curl wget -y

# Check if the vm is a proxmox vm (install qemu-guest-agent)
if  [[ $PROXMOX == true ]]; then
    sudo apt install qemu-guest-agent -y
fi

# Check if the vm is running on vmware (install open-vm-tools)
if  [[ $VMWARE == true ]]; then
    sudo apt install open-vm-tools -y
fi

# Check if the vm is running on vmware (ubuntu desktop has a different agent) (install open-vm-tools-desktop)
if  [[ $VMWAREDESKTOP == true ]]; then
    sudo apt install open-vm-tools-desktop -y
fi

if  [[ $MONITOR == true ]]; then
  sudo apt install iftop htop -y
fi

if  [[ $ZSH == true ]]; then
  sudo apt install zsh -y
  sudo usermod -s /usr/bin/zsh $(whoami)
fi

if  [[ $ZSHEXTRA == true ]]; then
  sudo apt-get install powerline fonts-powerline zsh-syntax-highlighting -y
  echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
fi

if  [[ $PL9K == true ]]; then
    sudo apt install zsh-theme-powerlevel9k
    echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
fi

if  [[ $OMZSH == true ]]; then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/
    install.sh -O -)"
fi

if [[ $MONGODB == true ]]; then
    sudo apt install mongodb
    sudo systemctl start mongodb
    sudo systemctl enable mongodb
    sudo systemctl status mongodb
fi

if [[ $MYSQL == true ]]; then
    sudo apt update
    sudo apt install mysql-server -y
    sudo mysql_secure_installation
fi

if [[ $NGINX == true ]]; then
    sudo apt update
    sudo apt install nginx -y
    sudo ufw allow "Nginx Full"
    sudo systemctl start nginx
    sudo systemctl enable nginx
    sudo systemctl status nginx
fi

if [[ $WINDSCRIBE == true ]]; then
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
    echo 'deb https://repo.windscribe.com/ubuntu bionic main' | sudo tee /etc/apt/sources.list.d/windscribe-repo.list
    sudo apt update
    sudo apt install windscribe-cli -y
fi

# Disable root login through ssh
echo PermitRootLogin no | sudo tee /etc/ssh/sshd_config
sudo service ssh restart

# Firewall
sudo ufw default deny
sudo ufw allow 22
sudo ufw enable

if [[ $ZSH == true ]] || [[ $ZSHEXTRA == true ]] || [[ $OMZSH == true ]]; then
    echo -e "${RED}You should restart your computer, but do that whenever you want${NC}"