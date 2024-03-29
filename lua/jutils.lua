local utilities = {}
-- utilities = {}

utilities.has_wal = function()
  if vim.fn.executable 'wal' == 1 then
    return true
  else
    return false
  end
end

--- Check if a file or directory exists in this path
utilities.exists = function(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

--- Check if a directory exists in this path
utilities.isdir = function(path)
  -- "/" works on both Unix and Windows
  return utilities.exists(path .. '/')
end

utilities.start_fortran_scratchpad = function()
  vim.cmd 'wincmd o'
  if utilities.isdir '/home/jordan/scratchpads/fortran-scratchpad/' then
    vim.cmd 'e /home/jordan/scratchpads/fortran-scratchpad/scratchpad.f90'
  end
  vim.cmd 'sp'
  vim.cmd 'BuildMe'
  vim.cmd 'wincmd k'
  -- vim.cmd 'sp'
  -- vim.cmd 'terminal cmake . -B ./build/ & ./build/make & ./build/scratchpad'
  -- vim.cmd 'wincmd k'
end

utilities.start_r_scratchpad = function()
  vim.cmd 'wincmd o'
  if utilities.isdir '/home/jordan/scratchpads/r-scratchpad/' then
    vim.cmd 'e /home/jordan/scratchpads/r-scratchpad/scratchpad.r'
  end
  vim.cmd 'sp'
  vim.cmd 'terminal R'
  vim.cmd 'wincmd k'
end

utilities.start_python_scratchpad = function()
  vim.cmd 'wincmd o'
  if utilities.isdir '/home/jordan/scratchpads/python-scratchpad/' then
    vim.cmd 'e /home/jordan/scratchpads/python-scratchpad/scratchpad.py'
  end
  vim.cmd 'sp'
  vim.cmd 'terminal python'
  vim.cmd 'wincmd k'
end

utilities.start_haskell_scratchpad = function()
  vim.cmd 'wincmd o'
  if utilities.isdir '/home/jordan/scratchpads/haskell-scratchpad/' then
    vim.cmd 'e /home/jordan/scratchpads/haskell-scratchpad/scratchpad.hs'
  end
  vim.cmd 'sp'
  vim.cmd 'terminal ghc --interactive'
  vim.cmd 'wincmd k'
end

utilities.start_c_scratchpad = function()
  vim.cmd 'wincmd o'
  if utilities.isdir '/home/jordan/scratchpads/c-scratchpad/' then
    vim.cmd 'e /home/jordan/scratchpads/c-scratchpad/examples/scratchpad.c'
  end
  vim.cmd 'sp'
  vim.cmd 'BuildMe'
  vim.cmd 'wincmd k'
end

utilities.start_cpp_scratchpad = function()
  vim.cmd 'wincmd o'
  if utilities.isdir '/home/jordan/scratchpads/cpp-scratchpad/' then
    vim.cmd 'e /home/jordan/scratchpads/cpp-scratchpad/examples/scratchpad.cpp'
  end
  vim.cmd 'sp'
  vim.cmd 'BuildMe'
  vim.cmd 'wincmd k'
end

utilities.start_bash_scratchpad = function()
  vim.cmd 'wincmd o'
  if utilities.isdir '/home/jordan/scratchpads/bash-scratchpad/' then
    vim.cmd 'e /home/jordan/scratchpads/bash-scratchpad/scratchpad.sh'
  end
  vim.cmd 'sp'
  vim.cmd 'terminal'
  vim.cmd 'wincmd k'
end

utilities.start_java_scratchpad = function()
  vim.cmd 'wincmd o'
  if utilities.isdir '/home/jordan/scratchpads/java-scratchpad/' then
    vim.cmd 'e /home/jordan/scratchpads/java-scratchpad/examples/src/main/java/templatejava/examples/ScratchPad.java'
  end
  vim.cmd 'sp'
  vim.cmd 'BuildMe'
  vim.cmd 'wincmd k'
end

utilities.run_java_main = function()
  vim.cmd 'wincmd o'
  if utilities.isdir '/home/jordan/scratchpads/java-scratchpad/' then
    vim.cmd 'e /home/jordan/scratchpads/java-scratchpad/examples/src/main/java/templatejava/examples/ScratchPad.java'
  end
  vim.cmd 'sp'
  vim.cmd 'BuildMe'
  vim.cmd 'wincmd k'
end

-- utilities.start_r_project()

utilities.dump = function(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. utilities.dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

utilities.get_active_buffer_in_tab = function(tab_number)
  -- Set the specified tabpage as the current tab
  vim.cmd('tabnext ' .. tab_number)

  -- Get the current window in the specified tab
  local current_win = vim.api.nvim_get_current_win()

  -- Get the active buffer handle from the current window
  local active_buffer = vim.api.nvim_win_get_buf(current_win)

  return active_buffer
end

utilities.move_current_tab_to_next_position = function()
  local current_tabpage = vim.fn.tabpagenr()

  if current_tabpage > 1 then
    local current_win = vim.api.nvim_tabpage_get_win(current_tabpage)
    local total_tabpages = vim.fn.tabpagenr '$'

    -- Check if the current tabpage is not the last one
    if current_tabpage < total_tabpages then
      local next_tabpage = current_tabpage + 1

      -- Move the current tab to the next position
      vim.cmd('tabmove ' .. next_tabpage)
    else
      print 'Current tab is already in the last position.'
    end
  else
    print 'Current tab is already in the first position.'
  end
end

-- http://lua-users.org/wiki/FileInputOutput

-- see if the file exists
utilities.file_exists = function(file)
  local f = io.open(file, 'rb')
  if f then
    f:close()
  end
  return f ~= nil
end

-- local lfs = require 'lfs'
-- local function file_exists(filename)
--   local attributes, _ = lfs.attributes(filename)
--   if attributes then
--     return true
--   else
--     return false
--   end
-- end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
utilities.lines_from = function(file)
  if not utilities.file_exists(file) then
    return {}
  end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

utilities.waldark_toggle = function()
  io.popen 'waldark'
end

utilities.waldark_dark = function()
  io.popen 'waldark --dark'
end

utilities.waldark_light = function()
  io.popen 'waldark --light'
end

-- Function to get a list of fold levels and their start and end lines
utilities.get_fold_list = function()
  local fold_levels = {}
  local current_fold = {}
  local line_number = 1

  while true do
    local fold_info = vim.fn.nvim_foldlevel(line_number)

    if fold_info == -1 then
      break
    end

    if fold_info > current_fold.level then
      table.insert(current_fold, line_number)
    elseif fold_info < current_fold.level then
      current_fold.end_line = line_number - 1
      table.insert(fold_levels, current_fold)
      current_fold = {}
      table.insert(current_fold, line_number)
    end

    current_fold.level = fold_info
    line_number = line_number + 1
  end

  -- Add the last fold (if any)
  if current_fold.level ~= nil then
    current_fold.end_line = line_number - 1
    table.insert(fold_levels, current_fold)
  end

  return fold_levels
end

utilities.toggle_neogit = function()
  local bufname = 'NeogitStatus'
  local buf_exists = vim.fn.bufexists(vim.fn.bufnr(bufname))
  if buf_exists == 1 then
    local windows = vim.api.nvim_list_wins()
    for _, win in ipairs(windows) do
      local buf_nr = vim.api.nvim_win_get_buf(win)
      local buf_name = vim.fn.bufname(buf_nr)
      if buf_name == bufname then
        vim.api.nvim_set_current_win(win)
        vim.cmd 'q'
        return
      end
    end
  else
    vim.cmd 'Neogit kind=vsplit'
  end
end

utilities.toggle_todo = function()
  local bufname = 'Trouble'
  local buf_exists = vim.fn.bufexists(vim.fn.bufnr(bufname))
  if buf_exists == 1 then
    local windows = vim.api.nvim_list_wins()
    for _, win in ipairs(windows) do
      local buf_nr = vim.api.nvim_win_get_buf(win)
      local buf_name = vim.fn.bufname(buf_nr)
      if buf_name == bufname then
        print 'Trouble buffer exists!'
        vim.api.nvim_set_current_win(win)
        vim.cmd 'q'
        return
      end
    end
  else
    vim.cmd 'Trouble todo'
  end
end

return utilities
