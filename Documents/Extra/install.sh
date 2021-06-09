#! /bin/sh

# Update
sudo pacman -Syu

# Drivers and Softwares
sudo pacman -S xorg xorg-xinit mesa xf86-video-intel xf86-video-vesa libva libva-intel-driver libva-mesa-driver wpa_supplicant connman linux-headers broadcom-wl-dkms

# Externals

# Oh my Zsh
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# yay (AUR)
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
mv yay ~/.local/share/Trash/files

# Side dependencies
sudo pacman -S fuse ueberzug unzip youtube-dl rsync

# Programs
sudo pacman -S bspwm sxhkd ranger alacritty dunst htop neovim rofi rofi-calc vivaldi vivaldi-ffmpeg-codecs feh python-pywal

yay -S flameshot rofigen-git rofi-greenclip polybar sublime-text-4 picom-ibhagwan-git connman-gtk discord_arch_electron apulse themix-theme-oomox-git

# Copy dotfiles
rsync rsync --exclude ".git/" . ~

# Change execution permissions
chmod +x ~/.config/alacritty/fixtheme.sh
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/sxhkd/sxhkdrc
chmod +x ~/.config/polybar/music.sh
chmod +x ~/.config/polybar/mic.sh
chmod +x ~/.local/bin/*

systemctl reboot