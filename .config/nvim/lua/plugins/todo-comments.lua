return {
  'folke/todo-comments.nvim',
  name = 'todo-comments',
  dependencies = { 'plenary' },
  config = function()
    require('todo-comments').setup({
      keywords = {
        FIX = { icon = "🐞", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = "💀", color = "hint" },
        HACK = { icon = "🔥", color = "warning" },
        WARN = { icon = "⚠️", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "🏎️", color = "hint", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "📝", color = "hint", alt = { "INFO" } },
        TEST = { icon = "🧪", color = "hint", alt = { "TESTING" } },
      }
    })
  end
}
