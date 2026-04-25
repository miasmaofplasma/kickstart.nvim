local function setup_keybindings()
  -- Define the name or pattern of the buffer you want to target.
  -- Wildcards (*) are allowed.
  local target_buffer_name = 'Cargo.toml' -- Example: "term://*" or "my_notes.md"

  -- Create a dedicated autocommand group to keep things organized.
  local my_augroup = vim.api.nvim_create_augroup('BufferSpecificKeymaps', { clear = true })

  -- Create the autocommand.
  vim.api.nvim_create_autocmd('BufEnter', {
    group = my_augroup,
    pattern = target_buffer_name,
    desc = 'Set keymaps for the target buffer',
    callback = function()
      -- This function runs only when you enter a buffer matching the pattern.
      -- All keymaps defined here will be local to that buffer.

      -- Example: Map 'jk' to <Esc> in Insert mode for this buffer only.
      vim.keymap.set('i', 'jk', '<Esc>', {
        noremap = true,
        silent = true,
        buffer = true, -- This is CRUCIAL for making the keymap buffer-local.
        desc = 'Exit insert mode',
      })

      -- Example: Map <leader>q to close the buffer in Normal mode.
      vim.keymap.set('n', '<leader>q', '<cmd>bdelete!<CR>', {
        noremap = true,
        silent = true,
        buffer = true, -- Make it buffer-local.
        desc = 'Close the buffer',
      })

      -- 💡 Add any other buffer-local keymaps you need here.
      -- vim.keymap.set('n', '<leader>x', 'some_command', { buffer = true, ... })
    end,
  })
end

return {
  'saecki/crates.nvim',
  tag = 'stable',
  config = function()
    require('crates').setup {
      {
        completion = {
          enabled = true,
        },
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
      },
    }
  end,
}
