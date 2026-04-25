return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'BufReadPost',
  config = function()
    local copilot = require 'copilot'
    copilot.setup {
      suggestion = {
        enabled = false,
      },
      copilot_model = 'gpt-41-copilot',
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        rust = true,
        lua = true,
        help = true,
      },
    }
  end,
}
