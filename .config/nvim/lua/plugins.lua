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

  use({ 'mbbill/undotree', config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
  end
  })

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = ' arch -arm64 -target arm64-apple-macos11 make' }

  use {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.0',
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
      vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { noremap = true });
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
      map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
      map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map('n', '<leader>hR', gs.reset_buffer)
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hn', gs.next_hunk)
      map('n', '<leader>hN', gs.prev_hunk)
      map('n', '<leader>hb', function() gs.blame_line { full = true } end)
      map('n', '<leader>tb', gs.toggle_current_line_blame)
      map('n', '<leader>hd', gs.diffthis)
      map('n', '<leader>hD', function() gs.diffthis('~') end)
      map('n', '<leader>td', gs.toggle_deleted)

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
      vim.keymap.set('n', '<leader>m', ':Telescope neoclip<cr>', { noremap = true });
    end
  }

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

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the four listed parsers should always be installed)
        ensure_installed = { "help", "javascript", "typescript", "c", "lua", "vim" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  })

  use({
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git);
    end
  })

  use {
    'MunifTanjim/eslint.nvim',
    as = 'eslint',
    config = function()
      require('eslint').setup({
        bin = 'eslint_d', -- or `eslint_d`
        cmd = 'eslint_d -f visualstudio',
        code_actions = {
          enable = true,
          apply_on_save = {
            enable = true,
            types = { "directive", "problem", "suggestion", "layout" },
          },
          disable_rule_comment = {
            enable = true,
            location = "separate_line", -- or `same_line`
          },
        },
        diagnostics = {
          enable = true,
          report_unused_disable_directives = false,
          run_on = "type", -- or `save`
        },
  
      })
    end,
    requires = { "jose-elias-alvarez/null-ls.nvim" }
  }


  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }
  use({
    "williamboman/mason-lspconfig.nvim",
    requires = "williamboman/mason.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "sumneko_lua", "tsserver", "intelephense", "eslint" },
      })
    end
  })
  use({ 'neovim/nvim-lspconfig', as = 'lspconfig', requires = 'williamboman/mason-lspconfig.nvim' })
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


  vim.diagnostic.config({
    virtual_text = true,
  })
end)
