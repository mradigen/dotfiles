export PATH="$HOME/.local/bin:$PATH"
# export EDITOR=nvim
export EDITOR=edit
export VISUAL=$EDITOR
export TERMINAL=alacritty
export POLYBAR_BAR=float
# export POLYBAR_BAR=top
export __GL_SHADER_DISK_CACHE_PATH="$HOME/.cache/nv"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
