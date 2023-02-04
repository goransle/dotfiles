function ColorMyPencils()
    vim.g.solarized_italic_comments = true
    vim.g.solarized_italic_keywords = false
    vim.g.solarized_italic_functions = false
    vim.g.solarized_italic_variables = false
    vim.g.solarized_contrast = true
    vim.g.solarized_borders = false
    vim.g.solarized_disable_background = true

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    require('solarized').set()

end

ColorMyPencils()
