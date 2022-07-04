# Here is a list of most of the cripts I utilize on my personal builds

# Initial script to update & upgrade default programs, as well as clean and restart itself
sudo apt update -y ; sudo apt upgrade -y ; sudo apt autoremove -y ; sudo apt autoclean -y ; reboot

# Basic system information and diagnostoc tools
sudo apt install neofetch -y
sudo apt install htop -y
sudo apt install bpytop -y

# Linux personal settings wants
sudo apt install gnome-tweaks -y
sudo apt install ubuntu-restricted-extras -y

# Used for making backups 
sudo apt install timeshift -y 
# The '--tag' determine the frequency of backups, D= daily, W = Weekly, etc
sudo timeshift --create --comments "001_backup" --tags W 
# For restoring from backups
sudo timeshift --restore


# Shell customizations
sudo apt install zsh -y

