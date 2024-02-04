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
            })
            vim.keymap.set('n', '<F2>', reach.buffers, { noremap = true });
            vim.keymap.set('n', '<F3>', reach.marks, { noremap = true });
        end
    }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup({
            open_mapping = [[<C-'>]],
            direction = 'vertical',
            size = 80
        })
    end }

    use({ 'nvim-lua/plenary.nvim', as = 'plenary' })

    use({
        'ThePrimeagen/harpoon',
        as = 'harpoon',
        requires = 'plenary',
        config = function()
            require('harpoon').setup()
            vim.keymap.set('n', '<leader>m', function()
                require('harpoon.mark').add_file()
                print('file harpooned')
            end)
            vim.keymap.set('n', '<leader>\'', require('harpoon.ui').toggle_quick_menu)
            vim.keymap.set('n', '<leader>j', require('harpoon.ui').nav_next)
            vim.keymap.set('n', '<leader>k', require('harpoon.ui').nav_prev)
            vim.keymap.set('n', '<leader>t', function()
                require('harpoon.term').gotoTerminal(1)
                vim.g.maplocalleader = '<C>'
                vim.cmd.startinsert()
            end)
        end
    })

    use({ 'mbbill/undotree', config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
    })

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = ' arch -arm64 -target arm64-apple-macos11 make'
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = 'plenary',
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
            telescope.setup({
                pickers = {
                    find_files = {
                        hidden = true
                    }
                }
            });
            vim.keymap.set('n', 'ff', require('telescope.builtin').find_files, { noremap = true });
            vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { noremap = true });
            vim.keymap.set('n', 'fb', require('telescope.builtin').current_buffer_fuzzy_find, { noremap = true });
            vim.keymap.set('n', 'fg', require('telescope.builtin').live_grep, { noremap = true });
            vim.keymap.set('n', 'fs', require('telescope.builtin').grep_string, { noremap = true });
            vim.keymap.set('n', 'fr', require('telescope.builtin').resume, { noremap = true });
            require('telescope').load_extension('fzf')
        end
    }

    use {
        'kyazdani42/nvim-web-devicons'
    };
    require('nvim-web-devicons').setup()

    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
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

    -- use({
    --     "NTBBloodbath/galaxyline.nvim",
    --     -- your statusline
    --     config = function()
    --         require("galaxyline.themes.colors")
    --     end,
    --     -- some optional icons
    --     requires = { "kyazdani42/nvim-web-devicons", opt = true }
    -- })

    -- use { 'Everblush/everblush.nvim', as = 'everblush' }

    use {
        'ms-jpq/chadtree',
        run = 'python3 -m chadtree deps',
        config = function()
            local chad = require('chadtree');

            vim.keymap.set('n', '<F5>', chad.Open, { noremap = true });
        end
    }
            local chadtree_settings = {
            }


            vim.api.nvim_set_var('chadtree_settings', chadtree_settings)

    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the four listed parsers should always be installed)
                ensure_installed = { "help", "javascript", "typescript", "c", "lua", "vim", "rust" },

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

            local function add_current_file()
                local file = vim.api.nvim_buf_get_name(0);
                vim.cmd(':Git add '..file);
                print('Git added '..file)
            end

            vim.keymap.set('n', '<leader>ga', add_current_file);
            vim.keymap.set('n', '<leader>gc', ':Git commit');
            vim.keymap.set('n', '<leader>gp', ':Git push');
            vim.keymap.set('n', '<leader>gP', ':Git pull <CR>');
            vim.keymap.set('n', '<leader>gco', ':Git checkout ');
        end
    })

    use ('mfussenegger/nvim-lint')

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
                -- ensure_installed = { 'tsserver', 'eslint' },
            })
        end
    })
    use({
        'neovim/nvim-lspconfig',
        as = 'lspconfig',
        requires = 'williamboman/mason-lspconfig.nvim'
    })

    use 'simrat39/rust-tools.nvim'

    local rt = require("rust-tools")

    rt.setup({
        server = {
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
        },
    })

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

    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    width = 90,
                    options = {
                        number = true,
                        relativenumber = true,
                    }
                },
            }

            vim.keymap.set("n", "<leader>zz", function()
                require("zen-mode").toggle()
                vim.wo.wrap = false
            end)
        end
    })

    use({
        'shaunsingh/solarized.nvim',
        as = 'solarized'
    })
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            { 'kyazdani42/nvim-web-devicons', opt = true },
            { 'shaunsingh/solarized.nvim', opt = true }
        },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'solarized'
                },
                sections = {
                    lualine_a = { 'mode', 'location' },
                    lualine_b = { { 'filename', path = 1 }, 'filesize' },
                    lualine_c = { 'diagnostics', 'searchcount' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { { 'progress', }, 

                        {
                            'spotify',
                            color = function()
                                return {
                                    fg = '#1DB954',
                                    bg = '#282828',
                                    gui = 'bold'
                                }
                            end

                    } },
                    lualine_z = { 'branch', 'diff' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
            }
        end
    }
    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        }
    }

    -- use({
    --     'habamax/vim-godot',
    --     config = function()
    --         vim.g.godot_executable = '/Applications/Godot.app'
    --     end
    -- })
    --

    use ({'mattn/emmet-vim'});


    vim.diagnostic.config({
        virtual_text = true,
    })

    use {'github/copilot.vim', branch = 'release' }
end)
