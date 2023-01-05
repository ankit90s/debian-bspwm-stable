#!/bin/bash

# wps-fonts
git clone https://github.com/udoyen/wps-fonts.git
cd wps-fonts && cd wps && sudo  mv * /usr/share/fonts/
cd ../ && cd ../ && rm -rf wps-fonts

# Material Design Iconic Fonts
wget https://github.com/zavoloklom/material-design-iconic-font/releases/download/2.2.0/material-design-iconic-font.zip
sudo unzip material-design-iconic-font.zip -d /usr/share/fonts/
rm -f material-design-iconic-font.zip

cd /tmp
fonts=( 
"FiraCode" 
"Hack" 
"JetBrainsMono" 
"RobotoMono" 
"SourceCodePro" 
"UbuntuMono"
"BigBlueTerminal"
)

for font in ${fonts[@]}
do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$font.zip
    sudo unzip $font.zip -d /usr/share/fonts/$font/
    rm $font.zip
done
fc-cache -fv
