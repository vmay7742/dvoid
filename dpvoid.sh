#!/usr/bin/env bash

#set -e
#set -o pipefail

#echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/wheel
#sudo chmod 440 /etc/sudoers.d/wheel

echo "Changing TTL"
sudo tee /etc/sysctl.conf <<<net.ipv4.ip_default_ttl=65
cat /etc/sysctl.conf

sudo xbps-install -u xbps

sudo xbps-install -Su

sudo xbps-install -Su void-repo-nonfree void-repo-multilib-nonfree void-repo-multilib

sudo xbps-install -Su

echo "IWD"
sudo xbps-install -S iwd

echo "Vim and NM"
sudo xbps-install -Su NetworkManager

echo "Enabling Dbus"
sudo ln -s "/etc/sv/dbus" "/var/service"
sudo sv up dbus
sudo sv status dbus

echo "enabling NM"
sudo ln -sv "/etc/sv/NetworkManager" "/var/service/"
sudo sv up NetworkManager
sudo sv status NetworkManager

echo "Nvidia drivers"
sudo xbps-query -Rs nvidia
sudo xbps-install -S nvidia nvidia-libs-32bit nv-codec-headers nvidia-opencl

echo "System"
xbps-install -S xorg libX11-devel libXinerama-devel libXft-devel base-devel bspwm picom sxhkd dmenu feh tmux p7zip htop inxi lm_sensors pulseaudio pulsemixer wget bc fzf plocate bash-completion noto-fonts-ttf noto-fonts-cjk scrot Thunar thunar-volman gvfs gvfs-mtp mtpfs ntfs-3g ffmpeg ffmpegthumbnailer tumbler mediainfo yt-dlp xdotool kitty rxvt-unicode mpv sxiv firefox darktable gimp gmic-gimp inkscape audacity libreoffice obs mousepad qemu qbittorrent syncthing nomacs sct

git clone https://github.com/vmay7742/dvoid

sudo chmod -R 777 /home/v/dvoid

echo "Making bspwm"
mkdir -p .config/bspwm && mkdir -p .config/sxhkd

cp "/usr/share/doc/bspwm/examples/bspwmrc" "/home/v/.config/bspwm/"
cp "/usr/share/doc/bspwm/examples/sxhkdrc" "/home/v/.config/sxhkd/"

"cp /home/v/dvoid/.xinitrc" "/home/v/.xinitrc"
"cp /home/v/dvoid/.vimrc" "/home/v/.vimrc"
"cp /home/v/dvoid/.bashrc" "/home/v/.bashrc"
"cp /home/v/dvoid/.Xresources" "/home/v/.Xresources"

echo "Roboto Font"
cd /home/v/.local/share/ && mkdir /home/v/.local/share/fonts && wget -P /home/v/.local/share/fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/RobotoMono.tar.xz && cd /home/v/.local/share/fonts/ && tar -xf RobotoMono.tar.xz && rm RobotoMono.tar.xz && fc-cache -fv

cp "/home/v/dvoid/.config/bspwmrc" "/home/v/.config/bspwm/"
cp "/home/v/dvoid/.config/sxhkdrc" "/home/v/.config/sxhkd/"
cp -r "/home/v/dvoid/.config/kitty" "/home/v/.config/"
cp -r "/home/v/dvoid/.config/tmux" "/home/v/.config/"

#echo "Polybar"
#xbps-install -S polybar
#cp -r "/home/v/dvoid/.config/polybar" "/home/v/.config/"
#chmod -x /home/v/.config/polybar/modules/pipewire-mic.sh

sudo cp "/home/v/dvoid/picom.conf" "/etc/xdg/"

mkdir -p "/home/v/qemu"
