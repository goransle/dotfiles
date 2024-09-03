return {
    'toppair/reach.nvim',
    config = function()
        local reach = require('reach')
        reach.setup({
            notifications = true;
        })
        vim.keymap.set('n', '<F2>', reach.buffers, { noremap = true });
        vim.keymap.set('n', '<F3>', reach.marks, { noremap = true });

    end
}
