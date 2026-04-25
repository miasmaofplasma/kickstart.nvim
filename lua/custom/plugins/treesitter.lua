return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
      },
    }
    -- fix issue where notes files aren't being treated like markdown files
    require('vim.treesitter.language').register('markdown', 'telekasten')
  end,
}
