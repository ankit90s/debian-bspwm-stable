#!/bin/bash

echo
echo "Backing Up"
echo

rsync -aAXvP --delete ~/.config/bspwm ~/debian-bspwm/dotconfig
rsync -aAXvP --delete ~/.config/sxhkd ~/debian-bspwm/dotconfig
rsync -aAXvP --delete ~/.config/picom ~/debian-bspwm/dotconfig
rsync -aAXvP --delete ~/.config/dunst ~/debian-bspwm/dotconfig
rsync -aAXvP --delete ~/.config/kitty ~/debian-bspwm/dotconfig
rsync -aAXvP --delete ~/.config/nvim ~/debian-bspwm/dotconfig
rsync -aAXvP --delete ~/.config/polybar ~/debian-bspwm/dotconfig
rsync -aAXvP --delete ~/.config/rofi ~/debian-bspwm/dotconfig

# MPV
rsync -aAXvP --delete --exclude 'watch_later' ~/.config/mpv ~/debian-bspwm/dotconfig

# Alacritty
rsync -aAXvP --delete ~/.config/alacritty.yml ~/debian-bspwm/dotconfig
rsync -aAXvP --delete ~/.config/alacritty-themes ~/debian-bspwm/dotconfig

# redshift
rsync -aAXvP --delete ~/.config/redshift.conf ~/debian-bspwm/dotconfig
rsync -aAXvP --delete ~/.config/systemd/user/redshift.service ~/debian-bspwm/dotscripts

rsync -aAXvP --delete ~/.config/starship.toml ~/debian-bspwm/dotconfig

# Bash
rsync -aAXvP --delete ~/.bash_aliases ~/debian-bspwm/bash_aliases
rsync -aAXvP --delete ~/.bashrc ~/debian-bspwm/bashrc

# Ranger
rsync -aAXvP --delete ~/.config/ranger ~/debian-bspwm/dotconfig

# Fonts
# rsync -aAXvP --delete --exclude=".uuid" ~/.fonts/* ~/debian-bspwm/fonts

# Conky
rsync -aAXvP --delete ~/.config/conky ~/debian-bspwm/dotconfig

# scripts
rsync -aAXvP --delete ~/scripts ~/debian-bspwm

# Greenclip
rsync -aAXvP --delete ~/.config/greenclip.toml ~/debian-bspwm/dotconfig

# ytfzf
rsync -aAXvP --delete ~/.config/ytfzf ~/debian-bspwm/dotconfig

#  redshift
# rsync -aAXvP --delete ~/.config/systemd/user/redshift.service ~/debian-bspwm

# maps
# rsync -aAXvP --delete ~/maps ~/debian-bspwm

# betterlockscreen
# rsync -aAXvP --delete ~/.config/betterlockscreenrc ~/debian-bspwm

# custom scripts
# rsync -aAXvP --delete ~/.scripts/* ~/debian-bspwm/Scripts

# Jgmenu
# rsync -aAXvP --delete ~/.config/jgmenu ~/debian-bspwm

# apt source list
rsync -aAXvP /etc/apt/sources.list ~/debian-bspwm

# mime type
rsync -aAXvP ~/.config/mimeapps.list ~/debian-bspwm/dotconfig

echo
echo -e "\e[1;32m Backup Finished \e[0m"

