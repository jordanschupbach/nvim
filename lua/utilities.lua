function Dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. Dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

-- http://lua-users.org/wiki/FileInputOutput

-- see if the file exists
function file_exists(file)
  local f = io.open(file, 'rb')
  if f then
    f:close()
  end
  return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then
    return {}
  end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

function waldark_toggle()
  io.popen 'waldark '
end

function waldark_dark()
  io.popen 'waldark --dark'
end

function waldark_light()
  io.popen 'waldark --light'
end

-- -- tests the functions above
-- local file = 'test.lua'
-- local lines = lines_from(file)

-- -- print all line numbers and their contents
-- for k,v in pairs(lines) do
--   print('line[' .. k .. ']', v)
-- end
