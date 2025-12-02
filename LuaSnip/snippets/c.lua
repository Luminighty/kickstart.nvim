-- ~/.config/nvim/LuaSnip/snippets/c.lua (for C headers)
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

-- function to generate macro name from filename
local function guard()
  local name = vim.fn.expand('%:t:r'):upper() .. '_H'
  return name
end

return {
  s('csh', {
    t '#ifndef ',
    f(guard, {}),
    t { '', '#define ' },
    f(guard, {}),
    t { '', '', '', '#endif' },
  }),
}
