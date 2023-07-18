local u = require('utilities')

local dmodestring = u.lines_from('/home/jordan/.scripts/.mode')[1]

-- print("Darkmode: " .. tostring(dmodestring))
-- print(u.dump(dmodestring))

local darkmode = false
if dmodestring == 'dark' then
  darkmode = true
else
  darkmode = false
end

return {
  darkmode = darkmode,
}
