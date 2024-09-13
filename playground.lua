-- This is just a throwaway file

require 'global-utils'

fzy = require 'fzy'
haystack = { 'hello', 'hell', 'asdf', 'qwer', 'zxcv' }
needle = 'hel'
fzy.filter(needle, haystack)

haystacks = { 'cab', 'ant/bat/cat', 'ant/bat/ace' }
needle = 'abatc'
result = fzy.filter(needle, haystacks)

tbl = { a = 1.1, b = 'asdf', c = 3 }

print(dump(tbl))

--- Print hello world
-- Prints hellorr + name
-- @param name (string) your name
print_hello = function(name)
  print('hellorr' .. ' ' .. name)
end

print_hello 'worrrrlddzzyyy'

print(dump(vim.api.nvim_get_mode()))
print(dump(vim.api.nvim_list_wins()))

print(dump(vim.api.nvim_list_tabpages()))

print(vim.api.nvim_get_current_buf())
print(vim.api.nvim_get_current_win())

vim.api.nvim_win_set_height(vim.api.nvim_get_current_win(), 25)

-- vim.api.nvim_win_get_height

print(dump(tbl['c']))

print(vim.api.nvim_win_get_height(vim.api.nvim_get_current_win()))
