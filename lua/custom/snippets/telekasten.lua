-- Required LuaSnip modules
local ls = require 'luasnip'
local s = ls.s -- snippet
local i = ls.i -- insert node
local t = ls.t -- text node

-- This table will hold all your markdown snippets
local snippets = {
  s('mdl', {
    t '[',
    i(1, 'description'), -- Placeholder for link text
    t '](',
    i(2, 'url'), -- Placeholder for the URL
    t ')',
  }),
  -- You can add more snippets here, separated by commas
  -- s("another_trigger", { ... }),
}

-- You must return the snippets table
return snippets
