call plug#begin('~/.config/nvim/plugged')
	Plug 'junegunn/goyo.vim'
	Plug 'preservim/nerdtree'
call plug#end()

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

let g:goyo_width = 100
let g:goyo_height = 100

autocmd VimEnter * Goyo
" autocmd VimEnter * NERDTree | wincmd p

"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
