-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'tpope/vim-obsession'

  use {
    'toppair/reach.nvim',
    config = function()
      local reach = require('reach')
      reach.setup({
        notifications = true;
        vim.keymap.set('n', '<F2>', reach.buffers, {noremap = true} );
        vim.keymap.set('n', '<F3>', reach.marks, {noremap = true} );
      })
    end
  } 

	use {"davidgranstrom/nvim-markdown-preview"}

	use({
		"NTBBloodbath/galaxyline.nvim",
		-- your statusline
		config = function()
			require("galaxyline.themes.eviline")
		end,
		-- some optional icons
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	})

	use { 'Everblush/everblush.nvim', as = 'everblush' }

  use {
    'ms-jpq/chadtree', 
    run = 'python3 -m chadtree deps',
    config = function()
      local chad = require('chadtree');
      vim.keymap.set('n', '<F5>', chad.Open, {noremap = true} );
    end
  }


	use {'neovim/nvim-lspconfig', as ='lspconfig'}
	use 'ms-jpq/coq_nvim'
	
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			local trouble = require("trouble");
			trouble.setup {
				vim.keymap.set('n', '<F4>', trouble.toggle, { noremap=true})
			}
		end
	}

	use 'terrortylor/nvim-comment'
	require('nvim_comment').setup()


  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
  }
end)
