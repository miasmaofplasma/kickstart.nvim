return {
  'stevearc/quicker.nvim',
  dependencies = {
    -- bqf provides nice quickfix window features including preview
    'kevinhwang91/nvim-bqf',
  },
  config = function()
    local has_quicker, quicker = pcall(require, 'quicker')
    if not has_quicker then
      vim.notify('quicker.nvim not available', vim.log.levels.WARN)
      return
    end

    -- Basic setup for quicker (use defaults but expose commands)
    quicker.setup {}

    -- Use bqf defaults by loading it; bqf config can be added here if desired
    local ok_bqf, _ = pcall(require, 'bqf')
    if not ok_bqf then
      -- optional: bqf wasn't loaded yet; it'll be lazy-loaded by lazy.nvim when needed
    end

    -- Provide quickfix utilities under the quicker namespace
    -- Move the quickfix helpers here so they load alongside the plugin
    local api = vim.api
    local fn = vim.fn

    local function add_current_line_to_qf()
      local bufnr = api.nvim_get_current_buf()
      local cursor = api.nvim_win_get_cursor(0)
      local lnum = cursor[1]
      local lines = api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)
      local line = lines[1] or ''

      local item = { bufnr = bufnr, lnum = lnum, col = 1, text = line }
      local qfl = fn.getqflist()
      for _, it in ipairs(qfl) do
        if (it.bufnr == item.bufnr) and (it.lnum == item.lnum) and (it.text == item.text) then
          vim.notify('Quickfix already contains this line', vim.log.levels.INFO)
          return
        end
      end
      fn.setqflist({}, 'a', { items = { item } })
      vim.notify('Added current line to quickfix', vim.log.levels.INFO)
    end

    local function open_qf()
      api.nvim_command 'copen'
    end

    local function close_qf()
      api.nvim_command 'cclose'
    end

    local function remove_current_qf_entry()
      if vim.bo[0].filetype ~= 'qf' and vim.bo[0].buftype ~= 'quickfix' then
        vim.notify('Not in a quickfix window', vim.log.levels.WARN)
        return
      end

      local cursor = api.nvim_win_get_cursor(0)
      local win_line = cursor[1]
      local qfl = fn.getqflist()
      if not qfl or #qfl == 0 then
        vim.notify('Quickfix list is empty', vim.log.levels.INFO)
        return
      end
      if win_line < 1 or win_line > #qfl then
        vim.notify('No quickfix entry under cursor', vim.log.levels.WARN)
        return
      end
      table.remove(qfl, win_line)
      fn.setqflist({}, 'r', { items = qfl })
      if #qfl == 0 then
        api.nvim_command 'cclose'
        vim.notify('Removed entry; quickfix is empty, closed', vim.log.levels.INFO)
        return
      end
      local new_line = math.min(win_line, #qfl)
      api.nvim_win_set_cursor(0, { new_line, 0 })
      vim.notify('Removed quickfix entry', vim.log.levels.INFO)
    end

    local function clear_quickfix()
      fn.setqflist({}, 'r', { items = {} })
      -- close quickfix if open
      pcall(api.nvim_command, 'cclose')
      vim.notify('Cleared quickfix list', vim.log.levels.INFO)
    end

    -- Expose these via the quicker module for other scripts
    quicker.add_current_line_to_qf = add_current_line_to_qf
    quicker.open_qf = open_qf
    quicker.close_qf = close_qf
    quicker.remove_current_qf_entry = remove_current_qf_entry
    quicker.clear_quickfix = clear_quickfix

    -- Global keymaps (fallbacks) to ensure they work without which-key
    vim.keymap.set('n', '<leader>q<CR>', add_current_line_to_qf, { noremap = true, silent = true, desc = 'Add current line to quickfix' })
    vim.keymap.set('n', '<leader>qo', open_qf, { noremap = true, silent = true, desc = 'Open quickfix' })
    vim.keymap.set('n', '<leader>qq', close_qf, { noremap = true, silent = true, desc = 'Close quickfix' })
    vim.keymap.set('n', '<leader>qc', clear_quickfix, { noremap = true, silent = true, desc = 'Clear quickfix list' })

    -- When a quickfix buffer is opened, map dd to remove the entry under the cursor.
    api.nvim_create_autocmd('FileType', {
      pattern = 'qf',
      callback = function()
        vim.keymap.set('n', 'dd', remove_current_qf_entry, { buffer = true, noremap = true, silent = true, desc = 'Remove current quickfix entry' })
      end,
    })
  end,
}
