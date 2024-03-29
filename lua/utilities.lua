local utilities = {}

-- if true then
--   print 'was true'
-- else
--   print 'was false'
-- end

utilities.get_visual_selection = function()
  local s_start = vim.fn.getpos "'<"
  local s_end = vim.fn.getpos "'>"
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

-- function that extracts selected text
utilities.extract_selected_text = function()
  -- Get the start and end positions of the selected text
  local start_line, start_col, end_line, end_col = unpack(vim.fn.getpos "'<" + vim.fn.getpos "'>")
  -- Extract the selected text using the range
  local selected_text = vim.fn.getline(start_line, end_line)
  -- If the selection spans multiple lines, adjust the text
  if start_line ~= end_line then
    selected_text[#selected_text] = selected_text[#selected_text]:sub(1, end_col)
    selected_text[1] = selected_text[1]:sub(start_col)
  else
    selected_text[1] = selected_text[1]:sub(start_col, end_col)
  end
  -- Join the lines to create a single string
  selected_text = table.concat(selected_text, '\n')
  -- Print or use the extracted text as needed
  -- print(selected_text)
  -- You can also return the selected text to use it in other ways
  return selected_text
end

-- Make sure to require plenary.nvim at the beginning of your Lua configuration
-- local popup = require('plenary.popup')

function utilities.extract_selected_text_and_show_popup()
  local popup = require 'plenary.popup'
  -- Get the start and end positions of the selected text
  local start_line, start_col, end_line, end_col = unpack(vim.fn.getpos "'<" + vim.fn.getpos "'>")

  -- Extract the selected text using the range
  local selected_text = vim.fn.getline(start_line, end_line)

  -- If the selection spans multiple lines, adjust the text
  if start_line ~= end_line then
    selected_text[#selected_text] = selected_text[#selected_text]:sub(1, end_col)
    selected_text[1] = selected_text[1]:sub(start_col)
  else
    selected_text[1] = selected_text[1]:sub(start_col, end_col)
  end

  -- Join the lines to create a single string
  selected_text = table.concat(selected_text, '\n')

  -- Create a popup with the extracted text
  local popup_opts = {
    line = 10,
    col = 10,
    width = #selected_text + 4,
    height = #selected_text + 2,
    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    padding = { 0, 1, 0, 1 },
  }

  local popup_bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(popup_bufnr, 0, -1, false, vim.fn.split(selected_text, '\n'))
  local popup_winid = popup.create(popup_bufnr, popup_opts)

  -- You can close the popup after a delay (e.g., 5 seconds) if needed
  vim.defer_fn(function()
    vim.api.nvim_win_close(popup_winid, true)
  end, 5000)
end

utilities.extract_paragraph_at_cursor = function()
  -- Get the current line number
  local current_line = vim.fn.line '.'

  -- Find the start and end lines of the paragraph
  local start_line = current_line
  local end_line = current_line

  -- Find the start line of the paragraph
  while start_line > 1 and vim.fn.trim(vim.fn.getline(start_line - 1)) ~= '' do
    start_line = start_line - 1
  end

  -- Find the end line of the paragraph
  while end_line < vim.fn.line '$' and vim.fn.trim(vim.fn.getline(end_line + 1)) ~= '' do
    end_line = end_line + 1
  end

  -- Extract the paragraph text
  local paragraph_lines = {}
  for line = start_line, end_line do
    table.insert(paragraph_lines, vim.fn.getline(line))
  end

  -- Join the lines to create a single string
  local paragraph_text = table.concat(paragraph_lines, '\n')

  -- Print or use the extracted paragraph text as needed
  -- print(paragraph_text)
  -- You can also return the extracted paragraph text for further use
  return paragraph_text
end

-- utilities.readFromFile = function(file_path)
--   local file = io.open(file_path, "r");
--   if file then
--     local content = file:read("*a");
--     file:close();
--     return content;
--   else
--     return nil;
--   end
-- end

utilities.readFromFile = function(file_path)
  local bufnr = vim.fn.bufadd(file_path)
  if bufnr ~= 0 then
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    vim.api.nvim_buf_delete(bufnr, { force = true })
    if #lines > 0 then
      return table.concat(lines, '\n')
    else
      return 'Error: File is empty.'
    end
  else
    return 'Error: Unable to open the file.'
  end
end

utilities.readFromFile2 = function(file_path)
  local file = io.open(file_path, 'r') -- Open the file in read mode
  if file then
    local content = file:read '*a'
    file:close()
    if content == '' then
      return 'File was empty'
    else
      return content
    end
    return content
  else
    return 'Error: Unable to open the file.'
  end
end

utilities.show_simple_popup = function(text)
  local popup = require 'plenary.popup'
  local popup_opts = {
    line = vim.fn.line '.' + 1,
    col = vim.fn.col '.',
    width = 30,
    height = 3,
    padding = { 0, 1, 0, 1 },
    move_on_insert = true,
    close_on_buf_leave = true,
  }
  local popup_winid, popup_bufnr = popup.create(utilities.split_string_at_newlines(text), popup_opts)
end

utilities.show_paragraph_in_popup = function()
  local paragraph = utilities.extract_paragraph_at_cursor()
  utilities.show_simple_popup(paragraph)
end

utilities.runRScript = function(text)
  local temp_file1 = vim.fn.tempname()
  local temp_file2 = vim.fn.tempname()
  local file = io.open(temp_file1, 'w')
  if file then
    file:write(text)
    file:close()
  else
    print('Error: Could not open file temp_file1 (' .. temp_file1 .. ') for writing.')
    return
  end
  local command = 'Rscript ' .. temp_file1 .. ' > ' .. temp_file2
  local output = vim.fn.system(command)
  local file = io.open(temp_file1, 'w')
  if file then
    file:write(text)
    file:close()
  else
    print 'Error: Could not open file for writing.'
    return
  end
  local file = io.open(temp_file2, 'r')
  if file then
    local content = file:read '*a'
    return content
  else
    print('Unable to read' .. temp_file2)
  end
end

utilities.getCurrentBufferFilePath = function()
  local bufnr = vim.fn.bufnr '%'
  if bufnr ~= 0 then
    return vim.fn.bufname(bufnr)
  else
    return nil
  end
end

utilities.extractFilename = function(filepath)
  local filename = string.match(filepath, '[^/\\]+$')
  return filename or filepath
end

utilities.strip_newline_symbols = function(text)
  local result = text:gsub('\n', '')
  return result
end

utilities.run_lua_text = function(text)
  vim.cmd('lua ' .. utilities.replace_newlines_with_semicolons(text))
end

utilities.run_lua_paragraph = function()
  local text = utilities.extract_paragraph_at_cursor()
  vim.cmd('lua ' .. utilities.strip_newline_symbols(text))
end

utilities.split_string_at_newlines = function(text)
  local lines = {}
  for line in text:gmatch '[^\r\n]+' do
    table.insert(lines, line)
  end
  return lines
end

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

-- http://lua-users.org/wiki/FileInputOutput

-- see if the file exists
utilities.file_exists = function(file)
  local f = io.open(file, 'rb')
  if f then
    f:close()
  end
  return f ~= nil
end

utilities.init_ldmode = function()
  if not utilities.file_exists '/home/jordan/.cache/ldmode' then
    local file = io.open('/home/jordan/.cache/ldmode', 'w')
    file:write 'dark'
    file:close()
  end
end

utilities.get_ldmode = function()
  return utilities.lines_from '/home/jordan/.cache/ldmode'
end

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
  io.popen 'waldark '
end

utilities.waldark_dark = function()
  io.popen 'waldark --dark'
end

utilities.waldark_light = function()
  io.popen 'waldark --light'
end

utilities.swap_window_right = function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  vim.api.nvim_command 'wincmd l'
  local right_win = vim.api.nvim_get_current_win()
  local right_buf = vim.api.nvim_win_get_buf(right_win)
  if current_win ~= right_win then
    -- vim.api.nvim_command 'wincmd h'
    vim.api.nvim_win_set_buf(current_win, right_buf)
    vim.api.nvim_win_set_buf(right_win, current_buf)
  end
  -- return utilities.dump(current_buf)
end

utilities.swap_window_left = function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  vim.api.nvim_command 'wincmd h'
  local left_win = vim.api.nvim_get_current_win()
  local left_buf = vim.api.nvim_win_get_buf(left_win)
  if current_win ~= left_win then
    -- vim.api.nvim_command 'wincmd l'
    vim.api.nvim_win_set_buf(current_win, left_buf)
    vim.api.nvim_win_set_buf(left_win, current_buf)
  end
end

utilities.swap_window_up = function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  vim.api.nvim_command 'wincmd k'
  local up_win = vim.api.nvim_get_current_win()
  local up_buf = vim.api.nvim_win_get_buf(up_win)
  if current_win ~= up_win then
    -- vim.api.nvim_command 'wincmd j'
    vim.api.nvim_win_set_buf(current_win, up_buf)
    vim.api.nvim_win_set_buf(up_win, current_buf)
  end
end

utilities.swap_window_down = function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  vim.api.nvim_command 'wincmd j'
  local down_win = vim.api.nvim_get_current_win()
  local down_buf = vim.api.nvim_win_get_buf(down_win)
  if current_win ~= down_win then
    -- vim.api.nvim_command 'wincmd k'
    vim.api.nvim_win_set_buf(current_win, down_buf)
    vim.api.nvim_win_set_buf(down_win, current_buf)
  end
end

return utilities
