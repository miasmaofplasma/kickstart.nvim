return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'echasnovski/mini.diff',
      config = function()
        local diff = require 'mini.diff'
        diff.setup {
          -- Disabled by default
          source = diff.gen_source.none(),
        }
      end,
    },
  },
  config = function()
    local codecompanion = require 'codecompanion'
    local my_prompts = require 'utils.prompts'
    codecompanion.setup {
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
        cmd = {
          adapter = 'copilot',
        },
      },
      opts = {
        log_level = 'DEBUG',
      },
      extensions = {},
      prompt_library = my_prompts,
    }
    vim.api.nvim_set_keymap('n', '<leader>cc', ':CodeCompanion Toggle<CR>', { noremap = true, silent = true })
  end,
}
