 #!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# replace source file
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp ~/debian-bspwm-stable/sources.list /etc/apt/
sudo apt update && sudo apt upgrade -y

# xorg display server installation
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput xterm

# mouse package
sudo apt install -y xserver-xorg-input-mouse

# PACKAGE INCLUDES build-essential.
sudo apt install -y build-essential

# Microcode for Intel/AMD 
# sudo apt install -y amd-microcode
sudo apt install -y intel-microcode 

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends locate mtp-tools

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Download manager
sudo apt install -y wget axel curl aria2

# File Manager (eg. pcmanfm,krusader,thunar,nautilus)
sudo apt install -y pcmanfm

# Terminal (eg. terminator,kitty,xfce4-terminal)
sudo apt install -y kitty

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol

# Neofetch/HTOP
sudo apt install -y neofetch htop

# Network Manager
sudo apt install -y network-manager-gnome 

# Installation for Appearance management
sudo apt install -y lxappearance 

# Browser Installation (eg. chromium)
sudo apt install -y chromium

# Bittorrent client installation (eg. transmission)
sudo apt install -y transmission

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory
sudo apt install -y nitrogen
 
# Theme support
sudo apt install -y arc-theme

# icon theme
sudo apt install -y papirus-icon-theme
sudo apt install -y numix-icon-theme

# Fonts and icons for now
sudo apt install -y fonts-cascadia-code fonts-indic fonts-ubuntu fonts-crosextra-carlito fonts-crosextra-caladea fonts-liberation2 fonts-noto-color-emoji font-manager fonts-roboto

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --color=always --group-directories-first' 
sudo apt install -y exa

# Printing and bluetooth (if needed)
sudo apt install -y cups
sudo apt install -y bluez blueman simple-scan

sudo systemctl enable bluetooth
sudo systemctl enable cups

# Packages needed for bspwm installation
sudo apt install -y bspwm sxhkd picom numlockx libnotify-bin git python3 python3-pip qt5-style-plugins rsync

# rofi and dmenu
sudo apt install -y rofi dmenu

# Desktop Applications
sudo apt install -y geany scrot xarchiver lxpolkit conky gpicview kcalc gpick kdeconnect evince

# terminal apps
sudo apt install -y espeak translate-shell cmatrix hddtemp ncdu ranger calcurse

# Dependencies for alacritty terminal
# sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# Additional Packages
sudo apt install -y xsel psmisc grep sed gawk openssl ffmpeg qalc gzip

# Redshift installation
sudo apt install -y redshift

# redshift unit file
mkdir -p ~/.config/systemd/user
cp ~/debian-bspwm-stable/dotscripts/redshift.service ~/.config/systemd/user

# Installation of mpv latest version
# source ~/debian-bspwm-stable/mpv.sh

# Polybar
sudo apt install -y polybar -t bullseye-backports

# Dunst
sudo apt install -y dunst -t bullseye-backports

# yt-dlp
sudo apt install -y yt-dlp -t bullseye-backports

# Command line text editor -- nano preinstalled 
sudo apt install -y neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Restricted Extras
sudo apt install -y libavcodec-extra ttf-mscorefonts-installer rar unrar gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi

# Nordic Theme
# git clone https://github.com/EliverLara/Nordic.git
# sudo mv Nordic /usr/share/themes

# Cursor Setup
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors && sudo ./install.sh
cd ../ && rm -rf Nordzy-cursors

# wallpapers
wget https://gitlab.com/dwt1/wallpapers/-/archive/master/wallpapers-master.zip
sudo unzip wallpapers-master.zip -d /usr/share/images/
rm wallpapers-master.zip

# wps-fonts
git clone https://github.com/udoyen/wps-fonts.git
sudo mkdir -p ~/.local/share/fonts
cd wps-fonts && cd wps && sudo  mv * ~/.local/share/fonts
cd ../ && cd ../ && rm -rf wps-fonts
fc-cache -fv

# Material Design Iconic Fonts
wget https://github.com/zavoloklom/material-design-iconic-font/releases/download/2.2.0/material-design-iconic-font.zip
sudo unzip material-design-iconic-font.zip -d ~/.local/share/fonts/
rm -f material-design-iconic-font.zip
fc-cache -fv

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# Copy config files
cp -r ~/debian-bspwm-stable/dotconfig/* ~/.config

# Profile picture customisation
sudo mkdir -p /usr/share/images/profile-pic
sudo cp ~/debian-bspwm-stable/assets/penguin-g0dc85b0fd_640.png /usr/share/images/profile-pic

#rofi power menu
sudo cp ~/debian-bspwm-stable/dotscripts/rofi-power-menu /usr/local/bin

# greenclip
sudo cp ~/debian-bspwm-stable/dotscripts/greenclip /usr/local/bin

# nerdfonts installation
source ~/debian-bspwm-stable/nerdfonts.sh

# flatpak support
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# copy scripts folder to home directory
cp -r ~/debian-bspwm-stable/scripts ~/

# Nvidia driver prerequites
sudo apt install linux-headers-amd64 -y

# Theme support for kde/qt5 applications
sudo mv /etc/environment /etc/environment.bak
sudo cp ~/debian-bspwm-stable/environment /etc/

# Install Lightdm Console Display Manager
sudo apt install -y lightdm lightdm-gtk-greeter-settings
sudo apt install -y slick-greeter lightdm-settings
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target

# Clean
sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
