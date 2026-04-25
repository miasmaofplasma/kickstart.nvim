local M = {}

local function remove_map_func(mode, keys)
  return function()
    vim.keymap.del(mode, keys)
  end
end

function M.map(mode, keys, func, opts)
  vim.keymap.set(mode, keys, func, opts)
  return remove_map_func(mode, keys)
end

return M
