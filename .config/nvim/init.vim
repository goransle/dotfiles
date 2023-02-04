set encoding=utf-8
let g:airline_powerline_fonts = 1

lua require('plugins')
lua require('init')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

:COQnow -s
:tnoremap <Esc><Esc> <C-\><C-n>
:tnoremap <leader><Esc> <C-\><C-n>
:tnoremap <C-'> <C-\><C-n>
