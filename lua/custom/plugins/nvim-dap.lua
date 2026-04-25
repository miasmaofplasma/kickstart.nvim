return {
  -- debug adapter
  'mfussenegger/nvim-dap',
  dependencies = {
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'nvim-telescope/telescope-dap.nvim' },
  },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    local map = vim.keymap.set
    map('n', '<Leader>dl', dap.step_into, { desc = 'Debugger step into' })
    map('n', '<Leader>dj', dap.step_over, { desc = 'Debugger step over' })
    map('n', '<Leader>dk', dap.step_out, { desc = 'Debugger step out' })
    map('n', '<Leader>dc', dap.continue, { desc = 'Debugger continue' })
    map('n', '<Leader>db', dap.toggle_breakpoint, { desc = 'Debugger toggle breakpoint' })
    map('n', '<Leader>dd', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debugger set conditional breakpoint' })
    map('n', '<Leader>de', dap.terminate, { desc = 'Debugger reset' })
    map('n', '<Leader>dr', dap.run_last, { desc = 'Debugger run last' })
  end,
}
