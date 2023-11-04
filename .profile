export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export VISUAL=subl
export TERMINAL=alacritty
export POLYBAR_BAR=float

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
