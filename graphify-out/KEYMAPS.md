# Keymaps Cheat‑Sheet (generated)

This file summarizes the custom Neovim mappings in this configuration. Open graphify-out/keymaps.svg for a printable visual cheat-sheet.

Global / Utility
- n  <Esc> -> clear search highlight (nohlsearch)  (init.lua)
- n  <leader>q -> open diagnostic quickfix (vim.diagnostic.setloclist)  (init.lua)
- n  <leader>wo -> :only (close other windows)  (init.lua)
- n,t <Esc><Esc> -> exit terminal mode (send <C-\\><C-n>)  (init.lua)
- n  <leader>wt -> :tabnew (open new tab)  (init.lua)
- n  <leader>wc -> :tabclose (close tab)  (init.lua)
- n  + / - -> increment/decrement under cursor (opencode convenience)  (lua/custom/plugins/opencode.lua)

Search / Telescope / Finder (leader s...)
- n <leader>sh -> Telescope help_tags (search help)  (init.lua)
- n <leader>sk -> Telescope keymaps (show keymaps)  (init.lua)
- n <leader>sf -> Telescope find_files (fuzzy file picker)  (init.lua)
- n <leader>ss -> Telescope builtin pickers  (init.lua)
- n <leader>s* -> Telescope grep_string (search current word)  (init.lua)
- n <leader>sg -> Telescope live_grep (project grep)  (init.lua)
- n <leader>sd -> Telescope diagnostics picker  (init.lua)
- n <leader>sr -> Telescope resume  (init.lua)
- n <leader>s. -> Telescope oldfiles (recent files)  (init.lua)
- n <leader>st -> Telescope treesitter picker  (init.lua)
- n <leader>s<leader> -> Telescope buffers  (init.lua)
- n <leader>sw -> :Telescope workspaces  (init.lua)
- n <leader>so -> Telekasten find_notes (notes search)  (init.lua)

Window & Panes
- n <leader>wm -> WindowsMaximize (maximize current window)  (lua/custom/plugins/windows.lua)
- n <leader>we -> WindowsEqualize (equalize splits)  (lua/custom/plugins/windows.lua)
- n go / goo -> opencode helpers (open opencode UI or variants)  (lua/custom/plugins/opencode.lua)

Terminal & Opencode Helpers
- n,x <leader>o? -> opencode interactive helper  (lua/custom/plugins/opencode.lua)
- n,x <leader>oa -> opencode action (contextual)  (lua/custom/plugins/opencode.lua)
- n,t <leader>oo -> opencode toggle (works in terminal)  (lua/custom/plugins/opencode.lua)
- n <C-k> / <C-j> -> opencode custom motions  (lua/custom/plugins/opencode.lua)

LSP / Go-To / Code Actions (gr* / g* helpers)
- n grn -> vim.lsp.buf.rename (rename symbol)  (init.lua — set in LSP on_attach)
- n,x gra -> LSP code action (apply code action)  (init.lua)
- n grr -> Telescope lsp_references (show references)  (init.lua)
- n gri -> Telescope lsp_implementations (goto implementations)  (init.lua)
- n grd -> vim.lsp.buf.definition (goto definition)  (init.lua)
- n grD -> vim.lsp.buf.declaration (goto declaration)  (init.lua)
- n gO -> Telescope lsp_document_symbols (document symbols)  (init.lua)
- n gW -> Telescope lsp_dynamic_workspace_symbols (workspace symbols)  (init.lua)
- n grt -> Telescope lsp_type_definitions (type definitions)  (init.lua)
- n <leader>xh -> toggle inlay hints (LSP feature)  (init.lua)

Debugging (nvim-dap)
- n <Leader>dl -> dap.step_into  (lua/custom/plugins/nvim-dap.lua)
- n <Leader>dj -> dap.step_over  (lua/custom/plugins/nvim-dap.lua)
- n <Leader>dk -> dap.step_out  (lua/custom/plugins/nvim-dap.lua)
- n <Leader>dc -> dap.continue  (lua/custom/plugins/nvim-dap.lua)
- n <Leader>db -> dap.toggle_breakpoint  (lua/custom/plugins/nvim-dap.lua)
- n <Leader>de -> dap.terminate  (lua/custom/plugins/nvim-dap.lua)
- n <Leader>dr -> dap.run_last  (lua/custom/plugins/nvim-dap.lua)

Testing / neotest
- n <leader>ta -> run nearest test  (lua/custom/plugins/neotest.lua)
- n <leader>tr -> run tests / re-run  (lua/custom/plugins/neotest.lua)
- n <leader>td -> debug test  (lua/custom/plugins/neotest.lua)
- n <leader>ts -> test summary / toggle  (lua/custom/plugins/neotest.lua)

Rust-specific
- n K -> Rust hover actions (override builtin K)  (after/ftplugin/rust.lua)
- n <C-k> -> <Plug>RustHoverAction  (after/ftplugin/rust.lua)
- n,x gra -> RustLsp codeAction  (after/ftplugin/rust.lua)
- n <leader>xe -> RustLsp explainError  (after/ftplugin/rust.lua)

Notes & caveats
- Many mappings are created in LSP's on_attach as buffer-local; they only exist when the LSP server attaches to a buffer.
- Plugin-specific commands require that plugin to be installed and configured.
- For a printable visual version, open graphify-out/keymaps.svg.

If you'd like the full annotated report (with file:line references and code snippets), say "full" and I'll expand each entry.
