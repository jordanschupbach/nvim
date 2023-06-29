local utilities = {}

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

return utilities
