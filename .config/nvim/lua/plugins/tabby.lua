return {
  'TabbyML/vim-tabby',
  event = "VimEnter",
  config = function()
    vim.g.tabby_node_binary = '/Users/goranslettemark/.local/share/nvm/v20.12.0/bin/node'
    vim.g.tabby_trigger_mode = 'manual'
  end
}
