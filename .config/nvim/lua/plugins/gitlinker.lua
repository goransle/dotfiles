return {
  'ruifm/gitlinker.nvim',
  dependencies = { 'plenary' },
  config = function()
    require('gitlinker').setup()

    vim.api.nvim_set_keymap(
    'n',
    '<leader>gx',
    '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
    {silent = true}
    )
  end
}
