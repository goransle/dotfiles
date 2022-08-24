
set encoding=utf-8
let g:airline_powerline_fonts = 1

lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

nnoremap <F5> <cmd>CHADopen<cr>
nnoremap <F2> <cmd>ReachOpen buffers<cr>
nnoremap <F3> <cmd>ReachOpen marks<cr>

