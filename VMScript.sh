# This is gonna be a recreation of my original script and testing what to make work. 
# As usual go download my personal favorite distro Pop_OS! from System76
# https://system76.com/pop/download/

# In the Vm I setup everything manual and then finished the setup and reset the machine.

# gonna paste over and edit things from my old script down below. 


# -----------------------------------------------------------

# Here is a list of scripts I use on my personal builds
# A special automated version will be made follwing this build
# P.s. Can also be used for Debian based Linux distros

# Chnage Default hostname, personally 'New Machine X 001' = NMX001 is my fave
sudo hostnamectl set-hostname <input-name>

# Add Min and Max buttons quickly 
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Initial updates for drivers and binaries w/ self-clean. I don't add the reboot altogether in ncase something breaks, so I can fix it, 
sudo apt update ; sudo apt upgrade ; sudo apt dist-upgrade ; sudo apt autoremove ; sudo apt autoclean ; flatpak update
reboot

# I coudl add this t the ones above but I'd rather just keep it separate
sudo pop-upgrade recovery upgrade from-release # this updates the recovery partition
reboot

# System Info tools, like a task manager but for linux.
sudo apt install neofetch -y # Shows basic system specification
sudo apt install htop -y # Shows all active tasks and
sudo apt install bpytop -y # Just a cooler version of HTOP, coded in Python.

# Ubuntu extra setup enables
sudo apt install gnome-tweaks -y 
sudo apt install gnome-shell-extensions
sudo apt install ubuntu-restricted-extras -y
sudo apt install git -y
sudo apt install git git-lfs -y ; git-lfs install # This just checks. 

# These folders hold my Themes and Icons for my entire distro. 
# I like em at home directory, cause I make custom oneoffs sometiems of other themes.
mkdir ~/.themes    
mkdir ~/.icons
# I like WhiteSur-Dark as my DE theme, May fanbot w/o ever (personaly) owning a Mac.

#--------------------------------------------------------------------------------------------
# Terminal Shell Customization | ZSH + Oh-My-ZSh + Oh-My-Posh
# Install ZSh-------
sudo apt install zsh -y  
chsh -s $(which zsh)  # Chnages shel from BASH to ZSh
gnome-session-quit # Relog (Log out & Log In)
# Complete ZSh Initial setup after opening terminal . 
echo $SHELL ; $SHELL --version # Expected result: '/bin/zsh zsh 5.X'
# Run ZSH then setup as default

# There Should be more should plug ins to add to ZSh gonna dd them here to test in the VM
## I normally dont add customizaion and leave emf or late but this script is gonna be a recolection of starting from scratch and adding edits
# I'll add it to the edits tomorrow when I wake up if it doesn't
 
# Adds Oh-My-Zsh (OMZ) to ZSH, this expands more features and customization
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.bak # Backup .zshrc
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
gedit ~/.zshrc # Edit some default sections as listed below
ZSH_THEME="robbyrussell" # The theme most ppl default to, until we get oh-my-posh
# Not sure if I needed to chsh sine I did it before, but I'll update this again soon.
# I tend to update my machine quarterly so it will be soon rnough to find out

# Installing the pretty terminal stuff 
# it seems that I had this  setup wrong, just follow the directrions more clearly this time around. 
curl -s https://ohmyposh.dev/install.sh | sudo bash -s
gedit ~/.zshrc # Add in the prompt
eval "$(oh-my-posh init zsh)" # Add this to .zshrc
exec zsh # Test after
# Not sure how to place it but make sure its in the home menu
git clone https://github.com/julioaalvarez/New_Linux_Install/.poshthemes 
gedit ~/.zshrc # Add in the customization
eval "$(oh-my-posh init zsh --config ~/.poshthemes/dracula.omp.json)" 
exec zsh # test the theme chnage
# So it was like my third time having a funny issue w/ the reinstall and it wasn't working. 
# Shut down my pc and came back the next day and now it's fine???? No, clue if a hard reset was all i needed for it to exec, but I guess so. 



# Python install and a fun script when the terminal opens up
sudo apt install python3 -y
sudo apt install python3-pip -y
wget -qO - https://raw.githubusercontent.com/stautonico/python-color-scripts/main/install.sh | sudo zsh
python-colorscript --update
python-colorscript --art sus --256   # Test
gedit ~/.zshrc 
python-colorscript --art sus --256 # Paste into ~/.zshrc

# Personal System Dependencies & Apps
sudo apt install code -y
sudo apt install vim -y
sudo apt install vlc -y
flatpak install gitkraken -y
sudo pat install discord -y # Sometimes Discord from website is better. # Got the one from the Pop_OS Shop this time around, haha. 
sudo apt install obs-studio -y
sudo apt install gimp -y
sudo apt install tilix -y

# For some of these use the OEM website or the POP SHOPm if on POP_OS
~ Spotify
~ Zoom

# This section is for JetBrains Tool Box
# Actually, visit their website instead. I'll add an auto version w/ checks sometime in the future.
