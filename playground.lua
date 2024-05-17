Dump = function(o)
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

Lines = {
  'Name: nvim',
  'Type: lua',
  'Tests: 0/0 passing',
  'Coverage: ',
  ' - line: ' .. '100% (0/0)',
  ' - func: ' .. '100% (0/0)',
}

Tlines = {}
for line in Lines:gmatch '[^\n]*' do
  table.insert(Tlines, line)
end
print(Dump(Tlines))

Hl = {
  { 'Keyword', 0, 0, 5 },
  { 'Keyword', 1, 0, 5 },
  { 'Keyword', 2, 0, 5 },
  { 'Keyword', 3, 0, 5 },
}

ProjectData = { Lines, Hl }

print(Dump(ProjectData))
