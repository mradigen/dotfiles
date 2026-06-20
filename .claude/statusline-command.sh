#!/usr/bin/env bash
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory to ~
home_dir="$HOME"
short_cwd="${cwd/#$home_dir/~}"

# Build context info
ctx_info=""
if [ -n "$used" ]; then
  ctx_info=" ctx:${used}%"
fi

# agnoster-style: blue segment for dir, then model + context
printf "\033[0;34m\ue0b0 \033[0m%s\033[2m  %s%s\033[0m" "$short_cwd" "$model" "$ctx_info"
