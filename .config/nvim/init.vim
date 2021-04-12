call plug#begin('~/.config/nvim/plugged')
	Plug 'junegunn/goyo.vim'
call plug#end()

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop =4

autocmd VimEnter * Goyo
