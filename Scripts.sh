# Here is a list of scripts I use on my personal builds
# A special automated version will be made follwing this build
# P.s. Can also be used for Debian based Linux distros

# Chnage Default hostname, personally 'New Machine X 001' = NMX001 is my fave
hostnamectl set-hostname Linux001 --static

# Initial scripts to update & upgrade base defaults, w/ self-clean and restart
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove
sudo apt autoclean
sudo fwupdmgr get-devices
sudo fwupdmgr get-updates
sudo fwupdmgr update
flatpak update
sudo pop-upgrade recovery upgrade from-release # this updates the recovery partition
reboot

# Basic system information and diagnostoc tools
sudo apt install neofetch -y
sudo apt install htop -y
sudo apt install bpytop -y
sudo apt install iftop -y

# Linux personal settings wants
sudo apt install gnome-tweaks -y
sudo apt install gnome-shell-extensions
sudo apt install ubuntu-restricted-extras -y
sudo apt install nautilus-admin -y

# In Home Directory, using Ctrl + H shows hidden files for ease of theming
mkdir ~/.themes
mkdir ~/.icons

# Used for making backups 
# The '--tag' determine the frequency of backups, D= daily, W = Weekly, etc
# For '--restore' from backups
sudo apt install timeshift -y 
sudo timeshift --create --comments "001_backup" --tags W 
sudo timeshift --restore

# Shell customizations
sudo apt install zsh -y

# Personal System Dependencies
sudo apt install mongodb
sudo systemctl start mongodb
sudo systemctl enable mongodb
sudo systemctl status mongodb

sudo apt update
sudo apt install mysql-server -y
sudo mysql_secure_installation

sudo apt install snapd -y
snap install hello-world && hello-world

sudo apt install git git-lfs -y
git-lfs install
sudo apt install code -y
sudo apt install vim -y
sudo apt install kate -y
sudo apt install vlc -y
flatpak install gitkraken -y

sudo pat install discord -y # Sometimes Discord from website is better tho
flapack install zoom -y

sudo apt install -y libavcodec-extra libdvd-pkg; sudo dpkg-reconfigure libdvd-pkg # Codecs
sudo apt install obs-studio -y
sudo apt install gufw -y
