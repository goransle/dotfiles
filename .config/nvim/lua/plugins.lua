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
        vim.keymap.set('n', '<F2>', reach.buffers, { noremap = true });
        vim.keymap.set('n', '<F3>', reach.marks, { noremap = true });
      })
    end
  }

  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-'>]],
      direction = 'vertical',
      size = 80
    })
  end }

  use 'nvim-lua/plenary.nvim'

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = ' arch -arm64 -target arm64-apple-macos11 make' }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    },
    config = function()
      local telescope = require('telescope');
      telescope.setup()
      vim.keymap.set('n', 'ff', require('telescope.builtin').find_files, { noremap = true });
      vim.keymap.set('n', 'fb', require('telescope.builtin').current_buffer_fuzzy_find, { noremap = true });
      vim.keymap.set('n', 'fg', require('telescope.builtin').live_grep, { noremap = true });
      vim.keymap.set('n', 'fs', require('telescope.builtin').grep_string, { noremap = true });
      vim.keymap.set('n', 'fr', require('telescope.builtin').resume, { noremap = true });
      require('telescope').load_extension('fzf')
    end
  }

  use 'kyazdani42/nvim-web-devicons';
  require('nvim-web-devicons').setup()

  -- use {
  --   'tanvirtin/vgit.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   }
  -- }
  -- require('vgit').setup()
  --

  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }

  require('gitsigns').setup({
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      -- Actions
      map({ 'n', 'v' }, '<space>hs', ':Gitsigns stage_hunk<CR>')
      map({ 'n', 'v' }, '<space>hr', ':Gitsigns reset_hunk<CR>')
      map('n', '<space>hS', gs.stage_buffer)
      map('n', '<space>hu', gs.undo_stage_hunk)
      map('n', '<space>hR', gs.reset_buffer)
      map('n', '<space>hp', gs.preview_hunk)
      map('n', '<space>hn', gs.next_hunk)
      map('n', '<space>hN', gs.prev_hunk)
      map('n', '<space>hb', function() gs.blame_line { full = true } end)
      map('n', '<space>tb', gs.toggle_current_line_blame)
      map('n', '<space>hd', gs.diffthis)
      map('n', '<space>hD', function() gs.diffthis('~') end)
      map('n', '<space>td', gs.toggle_deleted)

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
  })

  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      local clip = require('neoclip').setup();
      vim.keymap.set('n', '<space>m', ':Telescope neoclip<cr>', { noremap = true });
    end
  }


  use { "davidgranstrom/nvim-markdown-preview" }

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
      vim.keymap.set('n', '<F5>', chad.Open, { noremap = true });
    end
  }


  use { 'neovim/nvim-lspconfig', as = 'lspconfig' }
  use 'ms-jpq/coq_nvim'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      local trouble = require("trouble");
      trouble.setup {
        vim.keymap.set('n', '<F4>', trouble.toggle, { noremap = true })
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
