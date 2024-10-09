return {
  -- Make sure to set this up properly if you have lazy=true
  'MeanderingProgrammer/render-markdown.nvim',
  opts = {
    file_types = { "markdown", "Avante" },
    heading = {
      backgrounds = {
        'RenderMarkdownSuccess'
      }
    }
  },
  ft = { "markdown", "Avante" },
}