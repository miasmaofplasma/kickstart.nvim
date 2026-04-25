return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  dependencies = {
    {
      -- debug adapter
      'mfussenegger/nvim-dap',
    },
    {
      -- rust debugger
      'vadimcn/codelldb',
    },
    {
      'rcarriga/nvim-dap-ui',
    },
  },
  config = function()
    local mason_registry = require 'mason-registry'
    local codelldb = mason_registry.get_package 'codelldb'
    local extension_path = vim.fn.expand '$MASON/packages/codelldb/extension'
    local codelldb_path = extension_path .. '/adapter/codelldb'
    local liblldb_path = extension_path .. '/lldb/lib/liblldb.so'
    -- If you are on Linux, replace the line above with the line below:
    -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    local cfg = require 'rustaceanvim.config'

    vim.g.rustaceanvim = {
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end,
}
