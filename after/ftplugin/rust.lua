local bufnr = vim.api.nvim_get_current_buf()

local map = vim.keymap.set
map(
  'n',
  'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp { 'hover', 'actions' }
  end,
  { silent = true, buffer = bufnr }
)
map('n', '<C-k>', '<Plug>RustHoverAction', { desc = 'Hover action' })

-- debugger
-- rustaceanvim
map({ 'n', 'x' }, 'gra', '<cmd>RustLsp codeAction<CR>', { desc = '[G]oto Code [A]ction' })
map('n', '<leader>xe', '<cmd>RustLsp explainError<CR>', { desc = '[E]xplain Error' })
map('n', '<Leader>dt', "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = 'Debugger testables' })
