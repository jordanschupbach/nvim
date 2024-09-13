print 'hello world'

-- local term = {
--   bufid = nil,
--   size = 10,
--   title = 'PTERM',
-- }

-- function TermToggle()
--   if term.bufid == nil then
--     print 'hello world - bufid'
--     vim.api.nvim_command ':split'
--     vim.api.nvim_command ':edit term://bash'
--     term.bufid = vim.api.nvim_get_current_buf()
--   else
--     print('hello world - ' .. term.bufid)
--   end
--   -- vim.api.nvim_buf_set_var(0, 'term_title', 'PTERM')
-- end

-- function IsTermCreated()
--   print 'hello world'
-- end

-- function PrintAllBuffers()
--   local current_window = vim.api.nvim_get_current_win()
--   local current_buffers = {}
--   for _, win in ipairs(vim.api.nvim_list_wins()) do
--     if win == current_window then
--       table.insert(current_buffers, vim.api.nvim_win_get_buf(win))
--     end
--   end
--   for _, buf in ipairs(current_buffers) do
--     -- Do something with buf, e.g., print its name
--     print(vim.api.nvim_buf_get_name(buf))
--   end
-- end

local term = {
  winid = nil,
  bufid = nil,
  chanid = nil,
  size = 10,
}

function GetTermID()
  return term.bufid
end

function TermToggle()
  if term.winid == nil then
    vim.api.nvim_command('botright ' .. term.size .. 'split')
    term.winid = vim.api.nvim_get_current_win()
    if term.bufid == nil then
      term.bufid = vim.api.nvim_create_buf(false, false)
    end
    vim.api.nvim_win_set_buf(term.winid, term.bufid)
    if term.chanid == nil then
      term.chanid = vim.fn.termopen(vim.o.shell, {
        detach = 1,
        on_exit = function()
          term.winid = nil
          term.bufid = nil
          term.chanid = nil
          term.size = 10
        end,
      })
      vim.bo.filetype = 'term'
      vim.wo.number = false
      vim.wo.relativenumber = false
    end
    vim.api.nvim_command 'startinsert'
  else
    vim.api.nvim_command 'stopinsert'
    term.size = vim.api.nvim_win_get_height(term.winid)
    vim.api.nvim_win_hide(term.winid)
    term.winid = nil
  end
end

function TermSendLine()
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_chan_send(term.chanid, line .. '\r')
end

function TermSendMakeRun()
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_chan_send(term.chanid, 'make run' .. '\r')
end

function TermSendFile()
  local n = vim.api.nvim_buf_line_count(0)
  local lines = vim.api.nvim_buf_get_lines(0, 0, n, true)
  for _, line in ipairs(lines) do
    vim.api.nvim_chan_send(term.chanid, line .. '\r')
  end
end

function TermSendMakeRun()
  local n = vim.api.nvim_buf_line_count(0)
  print 'hello world'
  -- local lines = vim.api.nvim_buf_get_lines(0, 0, n, true)
  vim.api.nvim_chan_send(term.chanid, 'make run\n' .. '\r')
  -- for _, line in ipairs(lines) do
  --   vim.api.nvim_chan_send(term.chanid, line .. '\r')
  -- end
end

local function visual_selection_range(start_marker, end_marker)
  local _, csrow, cscol, _ = unpack(vim.fn.getpos(start_marker))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos(end_marker))
  if csrow < cerow or (csrow == cerow and cscol <= cecol) then
    return csrow - 1, cscol, cerow - 1, cecol
  else
    return cerow - 1, cecol, csrow - 1, cscol
  end
end

function TermSendMark(start_mark, end_mark)
  local csrow, cscol, cerow, cecol = visual_selection_range(start_mark, end_mark)
  local lines = vim.api.nvim_buf_get_lines(0, csrow, cerow + 1, true)
  if csrow == cerow then
    vim.api.nvim_chan_send(term.chanid, lines[1]:sub(cscol, cecol) .. '\r')
  else
    vim.api.nvim_chan_send(term.chanid, lines[1]:sub(cscol, -1) .. '\r')
    for i = 2, #lines - 1, 1 do
      vim.api.nvim_chan_send(term.chanid, lines[i] .. '\r')
    end
    vim.api.nvim_chan_send(term.chanid, lines[#lines]:sub(1, cecol) .. '\r')
  end
end

function TermSendOp()
  TermSendMark("'[", "']")
end

function GetBuffers()
  local current_window = vim.api.nvim_get_current_win()
  local ret = {}

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win == current_window then
      table.insert(ret, vim.api.nvim_win_get_buf(win))
    end
  end
  return ret
end

function IsTermVisible()
  local ret = false
  for a, b in ipairs(vim.api.nvim_list_wins()) do
    print('bufnr:' .. a)
    print('bufnr:' .. b)
    local bufnr = vim.api.nvim_win_get_buf(b)
    if term.bufid == bufnr then
      ret = true
    end
  end
  print(ret)
end

function TermMakeRun()
  local visible = IsTermVisible()
  if not visible then
    vim.api.nvim_command 'ToggleTerm'
    vim.api.nvim_command 'TermSendMakeRun'
  else
    vim.api.nvim_command 'TermSendMakeRun'
  end
end

vim.cmd 'command! IsTermVisible :lua IsTermVisible()<CR>'
vim.cmd 'command! TermMakeRun :lua TermMakeRun()<CR>'
vim.cmd 'command! TermSendMakeRun :lua TermSendMakeRun()<CR>'
vim.cmd 'command! TermToggle :lua TermToggle()<CR>'
vim.cmd 'command! IsTermCreated :lua IsTermCreated()<CR>'
vim.cmd 'command! PrintAllBuffers :lua PrintAllBuffers()<CR>'

vim.cmd 'command! TermSendLine :lua TermSendLine()<CR>'
vim.cmd 'command! TermSendFile :lua TermSendFile()<CR>'
-- vim.cmd 'command! TermSendHello :lua TermSendHelloWorld()<CR>'
-- vim.cmd [[command! -range TermSendVisual :lua TermSendMark("'<", "'>")<CR>]]
