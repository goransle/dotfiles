return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
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
        lualine_x = { },
        lualine_y = { 'progress' },
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
