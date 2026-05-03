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

-- Centralized which-key registrations for discoverability (flat spec)
which_key.register({
  -- Search group
  { "<leader>s", group = "Search" },
  { "<leader>sh", desc = "Help Tags" },
  { "<leader>sk", desc = "Keymaps" },
  { "<leader>sf", desc = "Find Files" },
  { "<leader>ss", desc = "Telescope Pickers" },
  { "<leader>s*", desc = "Search Current Word" },
  { "<leader>sg", desc = "Live Grep" },
  { "<leader>sd", desc = "Diagnostics" },
  { "<leader>sr", desc = "Resume" },
  { "<leader>s.", desc = "Recent Files" },
  { "<leader>st", desc = "Treesitter" },
  { "<leader>s<leader>", desc = "Buffers" },
  { "<leader>sw", desc = "Workspaces" },
  { "<leader>so", desc = "Notes" },

  -- Test group
  { "<leader>t", group = "Test" },
  { "<leader>ta", desc = "Run All Tests" },
  { "<leader>tr", desc = "Run Test" },
  { "<leader>td", desc = "Debug Test" },
  { "<leader>ts", desc = "Test Summary" },
  { "<leader>to", desc = "Test Output" },

  -- Opencode group
  { "<leader>o", group = "Opencode" },
  { "<leader>o?", desc = "Ask opencode..." },
  { "<leader>oa", desc = "Execute opencode action..." },
  { "<leader>oo", desc = "Toggle opencode" },

  -- Wtf (c) group
  { "<leader>c", group = "Wtf" },
  { "<leader>cd", desc = "Debug diagnostic with AI" },
  { "<leader>cf", desc = "Fix diagnostic with AI" },
  { "<leader>cs", desc = "Search diagnostic with Google" },
  { "<leader>cp", desc = "Pick provider" },
  { "<leader>ch", desc = "Populate quickfix with previous chat history" },
  { "<leader>cg", desc = "Grep previous chat history with Telescope" },

  -- Git Hunk (h) group
  { "<leader>h", group = "Git Hunk" },
  { "<leader>hs", desc = "Stage Hunk" },
  { "<leader>hr", desc = "Reset Hunk" },
  { "<leader>hS", desc = "Stage Buffer" },
  { "<leader>hu", desc = "Undo Stage Hunk" },
  { "<leader>hR", desc = "Reset Buffer" },
  { "<leader>hp", desc = "Preview Hunk" },
  { "<leader>hb", desc = "Blame Line" },
  { "<leader>hd", desc = "Diff Against Index" },
  { "<leader>hD", desc = "Diff Against Last Commit" },

  -- Window (w) group
  { "<leader>w", group = "Window" },
  { "<leader>wm", desc = "Maximize" },
  { "<leader>we", desc = "Equalize" },
  { "<leader>wt", desc = "New Tab" },
  { "<leader>wc", desc = "Close Tab" },
  { "<leader>wo", desc = "Only" },

  -- Notes (n) group
  { "<leader>n", group = "Notes" },
  { "<leader>nn", desc = "New Note" },
  { "<leader>nd", desc = "Daily Note" },
  { "<leader>nw", desc = "Weekly Note" },
  { "<leader>n/", desc = "Search Notes" },

  -- Trouble (x) group
  { "<leader>x", group = "Trouble" },
  { "<leader>xx", desc = "Toggle Diagnostics" },
  { "<leader>xX", desc = "Buffer Diagnostics" },
  { "<leader>xs", desc = "Symbols" },
  { "<leader>xl", desc = "LSP Listings" },
  { "<leader>xL", desc = "Location List" },
  { "<leader>xQ", desc = "Quickfix List" },

  -- Debug (d) group
  { "<leader>d", group = "Debug" },
  { "<leader>dl", desc = "Step Into" },
  { "<leader>dj", desc = "Step Over" },
  { "<leader>dk", desc = "Step Out" },
  { "<leader>dc", desc = "Continue" },
  { "<leader>db", desc = "Toggle Breakpoint" },
  { "<leader>ddd", desc = "Set conditional breakpoint" },
  { "<leader>de", desc = "Terminate/Reset" },
  { "<leader>dr", desc = "Run Last" },

  -- Leader-as-leader (double-leader) mappings
  { "<leader><leader>q", desc = "Open diagnostic Quickfix" },
  { "<leader><leader>f", desc = "Format buffer" },
  { "<leader><leader>e", desc = "Open diagnostic float" },
  { "<leader><leader>xh", desc = "Toggle inlay hints" },
}, { noremap = true })

-- Register a few non-leader mappings for discoverability (flat spec + mode)
which_key.register({
  { "go", desc = "Add range to opencode" },
  { "goo", desc = "Add line to opencode" },
  { "<C-k>", desc = "Scroll opencode up" },
  { "<C-j>", desc = "Scroll opencode down" },
}, { mode = "n" })

return which_key
