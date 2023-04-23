#########
## ZSH ##
#########
#export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.
#export UPDATE_ZSH_DAYS=13
export ZSH="/usr/share/oh-my-zsh" # Path to your oh-my-zsh installation.
ZSH_THEME="agnoster"
ZDOTDIR="$HOME/.cache/zsh"
HISTFILE="$HOME/.cache/zsh/zsh_history"
COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Override theme: don't print user@machine
prompt_context() {}

###########################
## Environment Variables ##
###########################

# Basic
# Stuff like EDITOR, TERMINAL, VISUAL are all in .profile, so source it.
# Its there since bspwm and other stuff source .profile and not this
source $HOME/.profile

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

#export ALSA_CARD=PCH # Shifted task to ~/.asoundrc
export ANDROID_HOME="$HOME/.android"
export ANDROID_NDK="$HOME/.android/ndk"
export PATH="$PATH:$HOME/.android/platform-tools"
export NLYT="$HOME/Desktop/nlyt"

#############
## Aliases ##
#############

# General
alias androidvnc="adb forward tcp:2301 tcp:5901"
alias androidvnc-kill="adb forward --remove-all"
alias asdf="setxkbmap dvorak"
alias aoeu="setxkbmap us"
alias calc="qalc"
alias cls="clear"
alias mnt="sudo mount -t auto -o umask=0,uid=$(echo $USER),gid=$(echo $USER),rw"
alias umnt="sudo umount"
alias reset="reset; cat ~/.cache/wal/sequences"
#alias music="cd ~/Music/YT; youtube-dl -x --yes-playlist --audio-format flac --audio-quality 0 -o '%(title)s.%(ext)s'"
#alias music="cd ~/Music/YT; youtube-dl -x --yes-playlist --audio-quality 0 -o '%(title)s.%(ext)s'"
alias music="yt-dlp -x --yes-playlist --audio-quality 0 -o '%(title)s.%(ext)s'" # youtube-dl has issues
alias sensors="watch -n 0.5 sensors"
alias vnc="~/.vnc/noVNC/utils/novnc_proxy --vnc localhost:5901 --listen 0.0.0.0:5600 & vncserver :1 & ssh -N -R 5600:0.0.0.0:5600 as; killall -q Xvnc; bspc wm -r"
alias vnc-end="killall -q Xvnc ssh && bspc wm -r"
alias vpn="sudo openvpn ~/Documents/VPN/cysis.ovpn & disown"
alias zxc='sudo $(fc -ln -1)'

# Pacman
alias update="yay -Syu"
alias dump="yay -S"
alias yeet="yay -Rsn"
alias search="yay -Ss"
alias polish="sudo reflector --verbose --latest 10 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist"
alias clean="yay -Qqdtt | yay -Rsn - ; yay -Sc"

# Ricing
alias zshconf="${EDITOR} ~/.zshrc"
alias bspconf="${EDITOR} ~/.config/bspwm/bspwmrc"
alias sxconf="${EDITOR} ~/.config/sxhkd/sxhkdrc"
alias pbconf="${EDITOR} ~/.config/polybar/config.ini"
alias piconf="${EDITOR} ~/.config/picom/picom.conf"
alias scripts="/usr/bin/git --git-dir=$HOME/.local/bin/.git --work-tree=$HOME/.local/bin"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dots="dotfiles"
# Shifted updots to a dedicated script

###############
## Functions ##
###############

### Creates a box around text
# usage: box <text> <border-char>
box() {
	s=${2:-'#'}
	c="${s}${s} $1 ${s}${s}"
	echo $c | sed "s/./\\${s}/g"
	echo $c
	echo $c | sed "s/./\\${s}/g"
}

### Archive extraction (from DT)
# usage: ex <file>
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

displayprompt() {
	echo "\033[7;34m ~ \033[0;34m\ue0b0 \033[0m${1}"	
}

###############
## Autostart ##
###############

# startx if we are on tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

#############
## Startup ##
#############

# Starting display
displayprompt fet; echo; fet # Custom fetch
#tput bold; echo; emos
displayprompt todo; todo

# Starting commands
regularupdate 43200
