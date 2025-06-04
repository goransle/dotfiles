return {
  "yetone/avante.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  config = function()
    require("avante").setup({
      provider = "copilot"
      -- Note: You can also set 'auto_suggestions_provider = "copilot"'
      -- if you want Copilot for auto-suggestions. However, the avante.nvim
      -- documentation warns this can be expensive due to high-frequency requests.
      -- See: https://github.com/yetone/avante.nvim/issues/1048
    })
  end,
}
