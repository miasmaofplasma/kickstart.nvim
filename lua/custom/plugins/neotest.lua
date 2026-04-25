local function set_up_keybinding() end
local function tear_down_keybindings() end

return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-plenary',
    'nvim-neotest/neotest-vim-test',
  },
  config = function()
    local neotest = require 'neotest'
    neotest.setup {
      adapters = {
        require 'rustaceanvim.neotest',
        require 'neotest-plenary',
        -- require 'neotest-vim-test' {
        --   ignore_filetypes = { 'python', 'vim', 'lua' },
        -- },
      },
    }

    local map = vim.keymap.set
    map('n', '<leader>ta', function()
      neotest.run.run(vim.fn.getcwd())
    end, { desc = 'Run [A]ll Tests' })

    map('n', '<leader>tr', function()
      neotest.run.run()
    end, { desc = '[R]un Test' })

    map('n', '<leader>td', function()
      neotest.run.run { strategy = 'dap' }
    end, { desc = '[D]ebug Test' })

    map('n', '<leader>ts', function()
      neotest.summary.toggle()
    end, { desc = 'Test [S]ummary' })

    map('n', '<leader>to', function()
      neotest.output.open()
    end, { desc = 'Test [O]utput' })
  end,
}
