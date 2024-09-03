return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    local trouble = require("trouble")
    trouble.setup {}
    vim.keymap.set('n', '<F4>', trouble.toggle, { noremap = true })
  end
}
