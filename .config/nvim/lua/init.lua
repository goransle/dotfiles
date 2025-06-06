vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.mapleader = ' '
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true
-- vim.g.terminal_color_4 = '#ff0000'
-- vim.g.terminal_color_5 = 'green'

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<F5>", ":Explore<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<C-'>", function()
  local existing = vim.fn.bufnr("mainterm")

  if existing > -1 then
    vim.cmd('buffer ' .. existing)
  else
    vim.cmd('terminal')
    vim.cmd('keepalt file mainterm')
    -- Double-check the buffer was named correctly
    local new_buf = vim.fn.bufnr("mainterm")
    if new_buf > -1 then
      vim.cmd('buffer ' .. new_buf)
    end

    print('Unable to create terminal')
  end

  -- Ensure we're in insert mode
  vim.cmd('startinsert')
end)

-- local format = function()
--     local eslint_d = require('lint').linters.eslint_d;
--     table.insert(eslint_d.args);
--     require("lint").try_lint();
--     -- vim.cmd(':sleep 100m');
--     -- vim.cmd(':e'); -- totally safe
--
--     table.remove(eslint_d.args);
-- end



-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  if client.name == "eslint" then
    -- vim.cmd.LspStop('eslint')
    return
  end

  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end


  local active_clients = vim.lsp.get_clients()
  if client.name == 'denols' then
    for _, client_ in pairs(active_clients) do
      -- stop tsserver if denols is already active
      if client_.name == 'tsserver' then
        client_.stop()
      end
    end
  elseif client.name == 'tsserver' then
    for _, client_ in pairs(active_clients) do
      -- prevent tsserver from starting if denols is already active
      if client_.name == 'denols' then
        client.stop()
      end
    end
  end

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>.', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<leader>f',
  --   function()
  --     if (client.server_capabilities.documentFormattingProvider) then
  --       vim.lsp.buf.format({})
  --     end
  --     format()
  --   end
  --   , bufopts)

  local navbuddy = require("nvim-navbuddy")
  navbuddy.attach(client, bufnr)

  vim.keymap.set('n', '<leader>n', navbuddy.open)
end

require("config.lazy")

-- require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})

local lsp = require "lspconfig"
local coq = require "coq"

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

lsp.ts_ls.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  root_dir = function(fname)
    if lsp.util.root_pattern('deno.json')(fname) then
      return nil
    end
    return lsp.util.root_pattern('package.json', 'tsconfig.json')(fname)
  end,
  init_options = {
    lint = false
  }
}))

lsp.ocamllsp.setup({
	on_attach = on_attach,
})

--
-- lsp.denols.setup(coq.lsp_ensure_capabilities({
--   on_attach = on_attach,
--   root_dir = lsp.util.root_pattern('deno.json'),
--   init_options = {
--     lint = true
--   }
-- }))
--
-- lsp.intelephense.setup(coq.lsp_ensure_capabilities({
--   on_attach = on_attach,
--   init_options = {
--     lint = true
--   },
--   settings = {
--     intelephense = {
--       files = {
--         maxSize = 10000000000000
--       },
--       environment = {
--         includePaths = {
--           "~/hs/wordpress/wordpress/",
--           "~/hs/wordpress/plugins/"
--         }
--       }
--     }
--   }
-- }))
--
-- lsp.biome.setup({})
--
-- lsp.eslint.setup({
--   on_attach = function(client, bufnr)
--     -- vim.api.nvim_create_autocmd("BufWritePre", {
--     --     buffer = bufnr,
--     --     command = "EslintFixAll",
--     -- })
--   end,
--   settings = {
--     codeAction = {
--       disableRuleComment = {
--         enable = true,
--         location = "separateLine"
--       },
--       showDocumentation = {
--         enable = true
--       }
--     },
--     codeActionOnSave = {
--       enable = false,
--       mode = "all"
--     },
--     experimental = {
--       useFlatConfig = false
--     },
--     format = true,
--     nodePath = "",
--     onIgnoredFiles = "off",
--     problems = {
--       shortenToSingleLine = false
--     },
--     quiet = false,
--     rulesCustomizations = {},
--     run = "onType",
--     useESLintClass = false,
--     validate = "on",
--     workingDirectory = {
--       mode = "location"
--     }
--   }
-- })
--
--
--
-- lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
--   on_attach = on_attach,
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }))
--
--
-- lsp.cssls.setup({
--   on_attach = on_attach
-- })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lsp.mdx_analyzer.setup({
--   filetypes = { "markdown.mdx" },
-- });

require('colors')

require('lint').linters_by_ft = {
  markdown = { 'vale', },
  -- javascript = {'eslint_d'}
}

vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = { "term://*" },
  callback = function()
    print('terminal mode engaged');
  end
})

-- productivity +++
vim.api.nvim_create_user_command('W', ':w', {})
vim.api.nvim_create_user_command('Wq', ':wq', {})

local abbrevs = {
  boid = 'void',
  josn = 'json'
}

for typo, replacement in pairs(abbrevs) do
  vim.cmd(':iabbrev ' .. typo .. ' ' .. replacement)
  -- TODO: use this when it's released
  -- vim.keymap.set('!a', typo, replacement);
end
