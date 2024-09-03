return {
  'ms-jpq/chadtree',
  build = 'python3 -m chadtree deps',
  config = function()
    local chad = require('chadtree')
    vim.keymap.set('n', '<F5>', chad.Open, { noremap = true })
  end
}
