local M = {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "rust" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end,
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
}

return { M }
