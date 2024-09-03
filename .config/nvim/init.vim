set encoding=utf-8
let g:airline_powerline_fonts = 1
set listchars=tab:▸\ ,eol:¬

lua require('init')

:COQnow -s
:tnoremap <Esc><Esc> <C-\><C-n>
:tnoremap <leader><Esc> <C-\><C-n>
:tnoremap <C-'> <C-\><C-n>
