-- Centered command-line UI using folke/noice.nvim
-- Adds floating cmdline and popupmenu views in the center of the screen.
-- This file is loaded by lazy.nvim (placed in lua/custom/plugins/).

return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- notifications are optional but recommended
      'rcarriga/nvim-notify',
    },
    config = function()
      local has_noice, noice = pcall(require, 'noice')
      if not has_noice then
        return
      end

      noice.setup {
        -- route the command-line to a centered popup
        cmdline = {
          enabled = true,
          view = 'cmdline_popup',
          opts = {},
          format = {
            cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
            search_up = { kind = 'search', pattern = '^/', icon = '/' },
            search_down = { kind = 'search', pattern = '^\\?', icon = '?' },
          },
        },

        views = {
          cmdline_popup = {
            position = { row = '50%', col = '50%' },
            size = { width = 60 },
            border = { style = 'rounded', padding = { 1, 1 } },
            win_options = { winhighlight = 'Normal:Normal' },
          },
          popupmenu = {
            position = { row = '55%', col = '50%' },
            size = { width = 60 },
            border = { style = 'rounded', padding = { 0, 1 } },
            win_options = { winhighlight = 'Normal:Normal' },
          },
        },

        presets = {
          command_palette = true,
          long_message_to_split = true,
        },
      }
    end,
  },
}
