return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
  },

  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    dependencies = { 'plenary' },
    config = function()
      local telescope = require('telescope');
      local telescopeConfig = require("telescope.config")
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      table.insert(vimgrep_arguments, "--hidden")
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      telescope.setup({
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_files = {
            hidden = true
          }
        }
      });

      local telescope_ignore_patterns = {}

      vim.keymap.set("n", "<leader>tfi", function()
        vim.g.telescope_ignore_enabled = not vim.g.telescope_ignore_enabled

        require("telescope.config").set_defaults({
          file_ignore_patterns = vim.g.telescope_ignore_enabled and telescope_ignore_patterns or {},
        })

        print("Telescope ignore patterns are now " .. (vim.g.telescope_ignore_enabled and "enabled" or "disabled"))
      end, { noremap = true, desc = "Toggle telescope ignore patterns" })

      vim.keymap.set('n', 'ff', require('telescope.builtin').find_files, { noremap = true });
      vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { noremap = true });
      vim.keymap.set('n', 'fb', require('telescope.builtin').current_buffer_fuzzy_find, { noremap = true });
      vim.keymap.set('n', 'fg', require('telescope.builtin').live_grep, { noremap = true });
      vim.keymap.set('n', 'fs', require('telescope.builtin').grep_string, { noremap = true });
      vim.keymap.set('n', 'fr', require('telescope.builtin').resume, { noremap = true });

      -- telescope.load_extension('fzf')
    end
  },
}
