
set encoding=utf-8
let g:airline_powerline_fonts = 1

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

lua require('plugins')
lua require('init')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end


:COQnow -s

