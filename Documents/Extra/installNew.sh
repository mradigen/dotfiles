#! /bin/sh

# You preferably wanna run `sudo su` before this script to be able to execute everything without re-entering root password.

# Get closest mirrors before installing stuff
sudo pacman -Syy
sudo pacman -S reflector
sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# Update
sudo pacman -Syyuu
sudo pacman -S --needed git base-devel wget

git clone https://github.com/mradigen/dotfiles.git

cd dotfiles

wget https://raw.githubusercontent.com/mradigen/dotfiles/main/Documents/Extra/packages

# yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
# mv yay ~/.local/share/Trash/files
rm -r yay

# Oh my Zsh
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install EVERYTHING
yay -S --needed - < packages
# yay -S xorg xorg-xinit mesa xf86-video-intel xf86-video-vesa libva libva-intel-driver libva-mesa-driver wpa_supplicant connman linux-headers broadcom-wl-dkms fuse ueberzug unzip youtube-dl rsync bspwm sxhkd ranger moc alacritty dunst htop neovim rofi rofi-calc qutebrowser python-adblock feh python-pywal flameshot rofigen-git rofi-greenclip polybar sublime-text-4 picom-ibhagwan-git connman-gtk discord_arch_electron apulse themix-theme-oomox-git

# Copy dotfiles
rsync -r --exclude ".git/" . ~

# Change execution permissions
chmod +x ~/.config/alacritty/fixtheme.sh
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/sxhkd/sxhkdrc
chmod +x ~/.config/polybar/music.sh
chmod +x ~/.config/polybar/mic.sh
chmod +x ~/.local/bin/*

systemctl reboot
