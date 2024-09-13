-- {{{ mymap fun
--- Adds a new normal binding map.
--- Examples:
--- <pre>lua
---   vim.keymap.set('n', 'lhs', function() print("real lua function") end)
--- </pre>
---
---@param mode string|table     Mode short-name, see |nvim_set_keymap()|.
---                          Can also be list of modes to create mapping on multiple modes.
---@param key string           Left-hand side |{lhs}| of the mapping.
---@param value string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---
local function mymap(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end
-- }}} mymap fun

-- open neorepl below current buffer
vim.keymap.set('n', 'g:', function()
  -- get current buffer and window
  -- create a new split for the repl
  vim.cmd 'split'
  local buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()
  -- spawn repl and set the context to our buffer
  require('neorepl').new {
    -- lang = 'vim',
    lang = 'lua',
    buffer = buf,
    -- window = win,
  }
  -- resize repl window and make it fixed height
  vim.cmd 'resize 10 | setl winfixheight'
  local buf = vim.api.nvim_get_current_buf()
  SendTo_Bufnr = buf
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>k', true, false, true), 'm', true)
end)

mymap('n', '<A-return>', ':lua require"utilities".send_line_to_buffer()<CR>')
mymap('v', '<A-return>', ':lua require"utilities".send_lines_to_buffer()<CR>')
