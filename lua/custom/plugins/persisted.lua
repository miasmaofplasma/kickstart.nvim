return {
  'olimorris/persisted.nvim',
  event = 'VimEnter',
  config = function()
    local persisted = require 'persisted'
    persisted.setup { autoload = false, autostart = false }
    vim.api.nvim_create_autocmd('User', {
      pattern = 'PersistedSavePre',
      callback = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buf].filetype == 'neo-tree' then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end
      end,
    })
    vim.keymap.set('n', '<leader>ws', persisted.save, { desc = 'Session [S]ave' })
    vim.keymap.set('n', '<leader>wl', persisted.load, { desc = 'Session [L]oad' })
  end,
}
