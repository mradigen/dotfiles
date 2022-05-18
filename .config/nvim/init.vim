call plug#begin('~/.config/nvim/plugged')
	Plug 'junegunn/goyo.vim'
"	Plug 'preservim/nerdtree'
	Plug 'dylanaraps/wal.vim'
	Plug 'github/copilot.vim'
"	Plug 'kevinhwang91/rnvimr'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
call plug#end()

" wal.vim
colorscheme wal

setlocal autoindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent

" Mouse support
set mouse=a

"map <Leader>y "*y
vnoremap y "+y

" Goyo (Distraction Free)
let g:goyo_width = 100
let g:goyo_height = 100
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif
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
