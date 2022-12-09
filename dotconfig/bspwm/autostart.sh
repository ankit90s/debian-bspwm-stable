#! /bin/sh

$HOME/.config/polybar/launch.sh &

# tint2
# killall tint2
# tint2 &

pgrep -x picom > /dev/null || picom &
# pgrep -x clipit > /dev/null || clipit &

# Wallpaper
# feh --bg-fill $HOME/Pictures/wallpapers/0044.jpg &
killall nitrogen
nitrogen --restore &

# ibus
# killall ibus-daemon
# ibus-daemon

# polkit
pgrep -x lxpolkit > /dev/null || lxpolkit &

# trayer
# killall trayer
# trayer --align right &

# xfce4-panel
# killall xfce4-panel
# xfce4-panel &

# greenclip clipboard manager
killall greenclip
greenclip daemon &

# xfce4-power-manager
# killall xfce4-power-manager
# xfce4-power-manager &

# conky
killall conky 
conky -c /home/$USER/.config/conky/ak-dracula.conkyrc &

# Geoclue 2
/usr/libexec/geoclue-2.0/demos/agent &

# kde connect
pgrep -x /usr/lib/x86_64-linux-gnu/libexec/kdeconnectd >> /dev/null || /usr/lib/x86_64-linux-gnu/libexec/kdeconnectd &
pgrep -x kdeconnect-indicator > /dev/null || kdeconnect-indicator &

# nm-applet
# killall nm-applet
# nm-applet &

# Volumeicon
# killall volumeicon
# volumeicon &

# redshift
killall redshift
systemctl --user enable --now redshift.service

# Greetings
killall dunst
notify-send "Welcome Back"
