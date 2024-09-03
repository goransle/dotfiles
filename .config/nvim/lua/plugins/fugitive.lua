return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

    local function add_current_file()
      local file = vim.api.nvim_buf_get_name(0)
      vim.cmd(':Git add ' .. file)
      print('Git added ' .. file)
    end

    vim.keymap.set('n', '<leader>ga', add_current_file)
    vim.keymap.set('n', '<leader>gc', ':Git commit')
    vim.keymap.set('n', '<leader>gp', ':Git push')
    vim.keymap.set('n', '<leader>gP', ':Git pull <CR>')
    vim.keymap.set('n', '<leader>gco', ':Git checkout ')
  end
}
