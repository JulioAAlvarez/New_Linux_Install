# Here is a list of scripts I use on my personal builds
# A special automated version will be made follwing this build
# P.s. Can also be used for Debian based Linux distros

# Chnage Default hostname, personally 'New Machine X 001' = NMX001 is my fave
sudo hostnamectl set-hostname NEW_HOSTNAME

# Add Min and Max buttons quickly
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Initial updates from the base defaults, w/ self-clean and restart
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove
sudo apt autoclean
flatpak update
sudo pop-upgrade recovery upgrade from-release # this updates the recovery partition
reboot

# Sys Info & Diag tools, like task manager for linux.
sudo apt install neofetch -y
sudo apt install htop -y
sudo apt install bpytop -y

# Linux default setup wants
sudo apt install gnome-tweaks -y
sudo apt install gnome-shell-extensions
sudo apt install ubuntu-restricted-extras -y
sudo apt install nautilus-admin -y
sudo apt install git -y

# In Home Directory, using Ctrl + H shows hidden files for ease of theming
mkdir ~/.themes
mkdir ~/.icons
# I like WhiteSur-Dark as my DE theme

# Personal customizations I likefor my terminal
sudo apt install zsh -y  # Shell that I like
chsh -s $(which zsh)  # Chnages shel from BASH to ZSh
# Relog (Log out & Log In)
$SHELL --version # Expected result: 'zsh 5.8'
# Run ZSH then setup as default

# Install a font that I like from my own Repo
git clone https://github.com/JulioAAlvarez/New_Linux_Install/
# Then install it as usual
 
# Adds Oh-My-Zsh (OMZ) to ZSH, this expands more features and customization
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig # Backup .zshrc
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
gedit ~/.zshrc # Edit some default sections as listed below
ZSH_THEME="robbyrussell" # The theme most ppl default to, until we get oh-my-posh
# Not sure if I needed to chsh sine I did it before, but I'll update this again soon.
# I tend to update my machine quarterly so it will be soon rnough to find out

# Installing the pretty terminal stuff
curl -s https://ohmyposh.dev/install.sh | sudo bash -s
gedit ~/.zshrc # Add in the prompt
eval "$(oh-my-posh init zsh)" # Add this to .zshrc
exec zsh # Test after
# Not sure how to place it but make sure its in the home menu
git clone https://github.com/julioaalvarez/New_Linux_Install/.poshthemes 
gedit ~/.zshrc # Add in the customization
eval "$(oh-my-posh init zsh --config ~/.poshthemes/dracula.omp.json)" 
exec zsh # test the theme chnage

# Python install and a fun script when the terminal opens up
sudo apt install python3 -y
sudo apt install python3-pip -y
wget -qO - https://raw.githubusercontent.com/stautonico/python-color-scripts/main/install.sh | sudo zsh
python-colorscript --update
python-colorscript --art sus --256   # Test
gedit ~/.zshrc 
python-colorscript --art sus --256 # Paste into ~/.zshrc

# Personal System Dependencies & Apps
sudo apt install git git-lfs -y
git-lfs install
sudo apt install code -y
sudo apt install vim -y
sudo apt install vlc -y
flatpak install gitkraken -y
sudo pat install discord -y # Sometimes Discord from website is better.
sudo apt install obs-studio -y
sudo apt install gimp -y
sudo apt install tilix -y

# For some of these use the OEM website or the POP SHOPm if on POP_OS
~ Spotify
~ Zoom

# This section is for JetBrains Tool Box
# Actually, visit their website instead. I'll add an auto version w/ checks sometime in the future.
