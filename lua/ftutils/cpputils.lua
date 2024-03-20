-- local popup = require('plenary.popup');

local UCPP = {}

local utilities = require 'utilities'

local plenary = require('plenary.tbl').apply_defaults

a = {
  b = { 9, r = 12, 43, b = 13, 58 },
  c = { 'asdf', 'fdsa' },
}

print(utilities.dump(a))

-- utilities.dump({a }

UCPP.say_hello = function()
  print 'hello world'
end

UCPP.say_hello2 = function()
  print 'hello worldzzz'
end

UCPP.show_simple_popup = function(text)
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
  local popup_winid, popup_bufnr = popup.create({ text }, {})
end

UCPP.runRScript = function(text)
  local temp_file1 = vim.fn.tempname()
  local temp_file2 = vim.fn.tempname()
  local file = io.open(temp_file1, 'w')
  if file then
    file:write(text)
    file:close()
  else
    print 'Error: Could not open file for writing.'
    return
  end
  local command = 'Rscript ' .. temp_file1 .. ' > ' .. temp_file2
  local r_script = '/tmp/runrscript.R'
  local command = 'Rscript ' .. r_script
  local output = vim.fn.system(command)
  vim.cmd("echo '" .. output .. "'")
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

text = 'print(1:10)'

out = utilities.runRScript(text)

lines = utilities.readFromFile '/home/jordan/1'

lines = utilities.readFromFile2 '/home/jordan/1'

utilities.extract_selected_text_and_show_popup()

utilities.show_simple_popup(lines:gsub('\n', ''))

utilities.show_simple_popup 'simple popup'

print(lines:gsub('\n', ''))

local temp_file1 = vim.fn.tempname()

local temp_file2 = vim.fn.tempname()

print(temp_file1)

print(temp_file2)

local file = io.open(temp_file1, 'w')
if file then
  file:write(text)
  file:close()
else
  print 'Error: Could not open file for writing.'
  return
end

print(utilities.dump(temp_file2))

local command = 'Rscript ' .. temp_file1 .. ' > ' .. temp_file2

print(temp_file2)

print(command)

local output = vim.fn.system(command)

-- Extract text from file

print(utilities.dump(output))

print(temp_file2)

file = io.open(temp_file2, 'r')

if file then
  print 'yes'
else
  print 'no'
end

local txt = utilities.readFromFile(temp_file2)

print(utilities.dump(txt))

content = file:read '*a'

print(content)

file:close()

print(utilities.dump(content))

print(utilities.dump(txt))

local output = vim.fn.system(command)

print(temp_file2)

print(output)

print 'asddf'

vim.cmd("echo '" .. output .. "'")

-- /tmp/nvim.jordan/zyQ8yH/4

utilities.show_paragraph_in_popup()

local file_content = utilities.readFromFile(temp_file2)

if file_content then
  print 'File content:'
  print(file_content)
else
  print 'Error: Unable to open the file.'
end

print(file_content)

UCPP.run_current_file()

UCPP.say_hello2()

UCPP.show_simple_popup 'Hello wolrd'

return UCPP
