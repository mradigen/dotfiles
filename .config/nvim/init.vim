""""""""
" Goyo "
""""""""
runtime goyo.vim
command! -nargs=? -bar -bang Goyo call goyo#execute(<bang>0, <q-args>)

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" Goyo config (Distraction Free)
let g:goyo_width = 100
let g:goyo_height = 100
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif
autocmd VimEnter * Goyo
"""""""

" wal.vim
"colorscheme wal " Default is good enough

setlocal autoindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent

" Mouse support
set mouse=a

" Copy to clipboard
vnoremap y "+y

