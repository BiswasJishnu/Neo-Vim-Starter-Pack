"enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable airline fonts for status line
"let g:webdevicons_enable_airline_statusline = 1

"enable powerline fonts for statusline
let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Just show the file name not the file path 
let g:airline#extensions#tabline#fnamemod = ':t'

"enable web devicons for tabline
let g:webdevicons_enable_airline_tabline = 1
