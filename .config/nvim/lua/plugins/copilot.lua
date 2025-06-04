return {
  "github/copilot.vim",
  init = function()
    -- Disable automatic suggestions for all filetypes
    vim.g.copilot_filetypes = { ['*'] = false }
    -- You may want to set a keymap to trigger suggestions manually, e.g.:
    -- vim.keymap.set('i', '<C-Space>', '<Plug>(copilot-suggest)')
    -- The default key to accept a suggestion is usually Tab.
  end,
  -- You might need to run :Copilot setup or similar after installation
  -- if you haven't authenticated this plugin before.
}
