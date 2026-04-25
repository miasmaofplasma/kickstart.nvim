local M = {}
--- Creates enter and leave hooks for buffers matching a pattern.
---
--- @param pattern string The file glob pattern (e.g., "*.md", "*.lua").
--- @param on_enter function The function to call on entering the buffer.
--- @param on_leave function The function to call on leaving the buffer.
function M.buffer_hook_enter_exit(enter_event, exit_event, pattern, on_enter, on_leave)
  -- Create a unique group name to prevent autocommand duplication
  local group_name = 'BufferHooks_' .. pattern:gsub('%W', '')
  local group = vim.api.nvim_create_augroup(group_name, { clear = true })
  enter_event = enter_event or 'BufEnter'
  exit_event = exit_event or 'BufLeave'

  -- Create the autocommand for entering a buffer
  if on_enter then
    vim.api.nvim_create_autocmd(enter_event, {
      pattern = pattern,
      group = group,
      callback = on_enter,
    })
  end

  -- Create the autocommand for leaving a buffer
  if on_leave then
    vim.api.nvim_create_autocmd(exit_event, {
      pattern = pattern,
      group = group,
      callback = on_leave,
    })
  end
end

function M.on_file_save(pattern, callback)
  -- Create a unique group name to prevent autocommand duplication
  local group_name = 'BufferHooks_' .. pattern:gsub('%W', '')
  local group = vim.api.nvim_create_augroup(group_name, { clear = true })

  -- Create the autocommand for entering a buffer
  if callback then
    vim.api.nvim_create_autocmd('BufWrite', {
      pattern = pattern,
      group = group,
      callback = callback,
    })
  end
end

return M
