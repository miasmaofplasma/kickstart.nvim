local M = {}

function M.get_all_matches(pattern)
  pattern = pattern or '{{_(.+)_}}'
  local matches = {}
  for i, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    local start_index = 0
    while true do
      local i_start, i_end = string.find(line, pattern, start_index)
      if i_start and i_end then
        local snip_name = string.sub(line, i_start + 3, i_end - 3)
        matches[i] = { name = snip_name, i_start = i_start, i_end = i_end }
        start_index = i_end
      else
        break
      end
    end
  end

  return matches
end

return M
