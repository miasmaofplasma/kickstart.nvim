vim.g.calendar_no_mappings = 1
local function sub_luasnip()
  local path = vim.fn.expand '%:p'
  if string.match(path, 'templates') then
    return
  end

  local bf = require 'utils.buffer_find'

  -- get all the matches
  local matches = bf.get_all_matches '{{_(.+)_}}'
  local ls = require 'luasnip'
  -- get a list of all the markdown snipptes
  local snips = ls.get_snippets 'markdown'

  for ln, match in pairs(matches) do
    for _, snip in pairs(snips) do
      -- check to see if the match name is the same an availabe snippet
      if snip.trigger == match.name then
        local start = match.i_start - 1
        local jump_to_index = start == 0 and '' or start .. 'l'
        -- go to the line, move to the start index, and delete the template variable
        vim.cmd('normal ' .. ln .. 'G0' .. jump_to_index .. 'da{')
        -- expand the snippet in it's place
        ls.snip_expand(snip)
      end
    end
  end
end

return {
  'renerocksai/telekasten.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-telekasten/calendar-vim',
  },
  config = function()
    local home = vim.fn.expand '~/Documents/notes/'
    local templates = home .. '/' .. 'templates'
    local telekasten = require 'telekasten'
    telekasten.setup {
      new_note_filename = 'uuid-title',
      home = home,
      dailies = home .. '/' .. 'daily',
      weeklies = home .. '/' .. 'weekly',
      templates = templates,
      image_subdir = home .. '/' .. 'images',
      template_new_note = templates .. '/' .. 'new-note.md',
    }

    vim.api.nvim_create_user_command('SubSnip', sub_luasnip, {})
    local bu = require 'utils.buffer_hooks'

    bu.on_file_save(vim.fn.expand('$HOME/Documents/notes' .. '*.md'), function()
      sub_luasnip()
    end)

    -- set keybindings
    vim.keymap.set('n', '<leader>nn', telekasten.new_note, { desc = '[N]ote [N]ew' })
    vim.keymap.set('n', '<leader>nd', telekasten.goto_today, { desc = '[N]ote [D]aily' })
    vim.keymap.set('n', '<leader>nw', telekasten.goto_thisweek, { desc = '[N]ote [W]eekly' })
    vim.keymap.set('n', '<leader>n/', telekasten.search_notes, { desc = '[N]ote Search' })
  end,
}
