local wk_ok, which_key = pcall(require, 'which-key')
if not wk_ok then
  return
end

-- Configure which-key (moved from init.lua plugin opts)
which_key.setup {
  -- delay between pressing a key and opening which-key (milliseconds)
  -- this setting is independent of vim.o.timeoutlen
  delay = 0,
  icons = {
    -- set icon mappings to true if you have a Nerd Font
    mappings = vim.g.have_nerd_font,
    -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
    -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
    keys = vim.g.have_nerd_font and {} or {
      Up = '<Up> ',
      Down = '<Down> ',
      Left = '<Left> ',
      Right = '<Right> ',
      C = '<C-...> ',
      M = '<M-...> ',
      D = '<D-...> ',
      S = '<S-...> ',
      CR = '<CR> ',
      Esc = '<Esc> ',
      ScrollWheelDown = '<ScrollWheelDown> ',
      ScrollWheelUp = '<ScrollWheelUp> ',
      NL = '<NL> ',
      BS = '<BS> ',
      Space = '<Space> ',
      Tab = '<Tab> ',
      F1 = '<F1>',
      F2 = '<F2>',
      F3 = '<F3>',
      F4 = '<F4>',
      F5 = '<F5>',
      F6 = '<F6>',
      F7 = '<F7>',
      F8 = '<F8>',
      F9 = '<F9>',
      F10 = '<F10>',
      F11 = '<F11>',
      F12 = '<F12>',
    },
  },
}

which_key.add {
  { '<leader>c', group = 'Wtf', remap = false },
  { '<leader>cd', desc = 'Debug diagnostic with AI', remap = false },
  { '<leader>cf', desc = 'Fix diagnostic with AI', remap = false },
  { '<leader>cg', desc = 'Grep previous chat history with Telescope', remap = false },
  { '<leader>ch', desc = 'Populate quickfix with previous chat history', remap = false },
  { '<leader>cp', desc = 'Pick provider', remap = false },
  { '<leader>cs', desc = 'Search diagnostic with Google', remap = false },
  { '<leader>d', group = 'Debug', remap = false },
  { '<leader>dc', desc = 'Continue', remap = false },
  { '<leader>ddb', desc = 'Toggle Breakpoint', remap = false },
  { '<leader>dddd', desc = 'Set conditional breakpoint', remap = false },
  { '<leader>de', desc = 'Terminate/Reset', remap = false },
  { '<leader>dj', desc = 'Step Over', remap = false },
  { '<leader>dk', desc = 'Step Out', remap = false },
  { '<leader>dl', desc = 'Step Into', remap = false },
  { '<leader>dr', desc = 'Run Last', remap = false },
  { '<leader>h', group = 'Git Hunk', remap = false },
  { '<leader>hD', desc = 'Diff Against Last Commit', remap = false },
  { '<leader>hR', desc = 'Reset Buffer', remap = false },
  { '<leader>hS', desc = 'Stage Buffer', remap = false },
  { '<leader>hb', desc = 'Blame Line', remap = false },
  { '<leader>hd', desc = 'Diff Against Index', remap = false },
  { '<leader>hp', desc = 'Preview Hunk', remap = false },
  { '<leader>hr', desc = 'Reset Hunk', remap = false },
  { '<leader>hs', desc = 'Stage Hunk', remap = false },
  { '<leader>hu', desc = 'Undo Stage Hunk', remap = false },
  { '<leader>n', group = 'Notes', remap = false },
  { '<leader>n/', desc = 'Search Notes', remap = false },
  { '<leader>nd', desc = 'Daily Note', remap = false },
  { '<leader>nn', desc = 'New Note', remap = false },
  { '<leader>nw', desc = 'Weekly Note', remap = false },
  { '<leader>o', group = 'Opencode', remap = false },
  { '<leader>o?', desc = 'Ask opencode...', remap = false },
  { '<leader>oa', desc = 'Execute opencode action...', remap = false },
  { '<leader>oo', desc = 'Toggle opencode', remap = false },
  { '<leader>s', group = 'Search', remap = false },
  { '<leader>s*', desc = 'Search Current Word', remap = false },
  { '<leader>s.', desc = 'Recent Files', remap = false },
  { '<leader>s<leader>', desc = 'Buffers', remap = false },
  { '<leader>sd', desc = 'Diagnostics', remap = false },
  { '<leader>sf', desc = 'Find Files', remap = false },
  { '<leader>sg', desc = 'Live Grep', remap = false },
  { '<leader>sh', desc = 'Help Tags', remap = false },
  { '<leader>sk', desc = 'Keymaps', remap = false },
  { '<leader>so', desc = 'Notes', remap = false },
  { '<leader>sr', desc = 'Resume', remap = false },
  { '<leader>ss', desc = 'Telescope Pickers', remap = false },
  { '<leader>st', desc = 'Treesitter', remap = false },
  { '<leader>sw', desc = 'Workspaces', remap = false },
  { '<leader>t', group = 'Test', remap = false },
  { '<leader>ta', desc = 'Run All Tests', remap = false },
  { '<leader>td', desc = 'Debug Test', remap = false },
  { '<leader>to', desc = 'Test Output', remap = false },
  { '<leader>tr', desc = 'Run Test', remap = false },
  { '<leader>ts', desc = 'Test Summary', remap = false },
  { '<leader>w', group = 'Window', remap = false },
  { '<leader>wc', desc = 'Close Tab', remap = false },
  { '<leader>we', desc = 'Equalize', remap = false },
  { '<leader>wm', desc = 'Maximize', remap = false },
  { '<leader>wo', desc = 'Only', remap = false },
  { '<leader>wt', desc = 'New Tab', remap = false },
  { '<leader>x', group = 'Trouble', remap = false },
  { '<leader>xL', desc = 'Location List', remap = false },
  { '<leader>xQ', desc = 'Quickfix List', remap = false },
  { '<leader>xX', desc = 'Buffer Diagnostics', remap = false },
  { '<leader>xl', desc = 'LSP Listings', remap = false },
  { '<leader>xs', desc = 'Symbols', remap = false },
  { '<leader>xx', desc = 'Toggle Diagnostics', remap = false },
}

-- Register a few non-leader mappings for discoverability (modern spec + mode)
which_key.add({
  { '<C-j>', desc = 'Scroll opencode down', remap = false },
  { '<C-k>', desc = 'Scroll opencode up', remap = false },
  { 'go', desc = 'Add range to opencode', remap = false },
  { 'goo', desc = 'Add line to opencode', remap = false },
}, { mode = 'n', noremap = true })

which_key.add {
  { '<leader><leader>e', desc = 'Open diagnostic float', remap = false },
  { '<leader><leader>f', desc = 'Format buffer', remap = false },
  { '<leader><leader>q', desc = 'Open diagnostic Quickfix', remap = false },
  { '<leader><leader>xh', desc = 'Toggle inlay hints', remap = false },
}

return which_key
