return {
  'hrsh7th/nvim-cmp',
  version = false, -- last release is way too old
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- Copilot integration: provide source named 'copilot'
    'zbirenbaum/copilot-cmp',
    'zbirenbaum/copilot.lua',
    -- luasnip completion source (luasnip is configured in its own plugin file)
    'saadparwaiz1/cmp_luasnip',
  },
  -- Not all LSP servers add brackets when completing a function.
  -- To better deal with this, LazyVim adds a custom option to cmp,
  -- that you can configure. For example:
  --
  -- ```lua
  -- opts = {
  --   auto_brackets = { "python" }
  -- }
  -- ```
  -- opts can be a function returning the cmp configuration table
  opts = function()
    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
    local cmp = require 'cmp'
    local auto_select = true
    return {
      auto_brackets = {}, -- configure any filetype to auto add brackets
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert' .. (auto_select and '' or ',noselect'),
      },
      preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      },
      sources = cmp.config.sources {
        { name = 'copilot' },
        { name = 'lazydev' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'crates' },
        { name = 'buffer' },
        { name = 'render-markdown' },
        { name = 'luasnip' },
        -- { name = 'neorg' },
      },
    }
  end,

  -- Ensure copilot-cmp is initialized and then apply the cmp setup
  config = function(_, opts)
    -- copilot_cmp provides the 'copilot' completion source
    pcall(function()
      require('copilot_cmp').setup()
    end) -- ignore error if not installed yet
    local cmp = require 'cmp'
    cmp.setup(opts)
  end,
}
