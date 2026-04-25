return {
  'yorickpeterse/nvim-window',
  keys = {
    { '<leader><leader>', "<cmd>lua require('nvim-window').pick()<cr>", desc = 'Jump to window' },
  },
  config = true,
}
