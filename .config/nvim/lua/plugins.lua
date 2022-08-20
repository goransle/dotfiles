-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Simple plugins can be specified as strings
	use 'rstacruz/vim-closer'
	use 'toppair/reach.nvim'

	use {
		'glacambre/firenvim',
		run = function() vim.fn['firenvim#install'](0) end 
	}

	require('reach').setup({
		notifications = true
	})
end)
