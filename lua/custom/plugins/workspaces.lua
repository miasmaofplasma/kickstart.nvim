return {
  'natecraddock/workspaces.nvim',
  config = function()
    require('workspaces').setup {
      hooks = {
        open = function()
          require('persisted').load {}
        end,
      },
    }
  end,
}
