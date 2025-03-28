return {
  'TabbyML/vim-tabby',
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  event = "VimEnter",
  init = function()
    vim.g.tabby_node_binary = '/Users/goranslettemark/.local/share/nvm/v22.12.0/bin/node'
    vim.g.tabby_agent_start_command = { "npx", "tabby-agent", "--stdio" }
    vim.g.tabby_inline_completion_trigger = 'manual'

    vim.g.tabby_inline_completion_keybinding_accept = '<C-l>'
    vim.g.tabby_inline_completion_keybinding_trigger_or_dismiss = '<C-j>'
  end
}
