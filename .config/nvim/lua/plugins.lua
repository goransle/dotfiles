-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Simple plugins can be specified as strings
	use 'rstacruz/vim-closer'
	use 'toppair/reach.nvim'

	use {"davidgranstrom/nvim-markdown-preview"}


	use { 'Everblush/everblush.nvim', as = 'everblush' }

	use {'kyazdani42/nvim-web-devicons'}

	use {'ms-jpq/chadtree', run = 'python3 -m chadtree deps' }

	use 'ms-jpq/coq_nvim'

	use 'terrortylor/nvim-comment'
	require('nvim_comment').setup()


	use {
		'glacambre/firenvim',
		run = function() vim.fn['firenvim#install'](0) end 
	}

	require('reach').setup({
		notifications = true
	})
end)
