-- Plugin spec for yazi.nvim
-- Installs and configures yazi with sensible defaults from upstream README
return {
  {
    'mikavilpas/yazi.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true },
    },
    keys = {
      {
        '<leader>-',
        mode = { 'n', 'v' },
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        '<leader>\\',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      {
        '<c-up>',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },
    ---@type YaziConfig | {}
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
      -- sensible defaults; tweak to your liking in this file or override per-call
      clipboard_register = '*',
    },
    -- don't hijack netrw by default; enable in opts.open_for_directories if desired
    -- init = function()
    --   vim.g.loaded_netrwPlugin = 1
    -- end,
  },
}
