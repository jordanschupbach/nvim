local light_wallpaper_path = '~/wallpapers/light_wallpapers/'
local dark_wallpaper_path = '~/wallpapers/dark_wallpapers/'
local darkmode_path = '/home/jordan/.scripts/.mode'
local ju = require 'jutils'

local is_darkmode = function()
  local dmode = ju.lines_from(darkmode_path)
  if dmode[1] == 'dark' then
    return true
  end
  return false
end

local darkmode = true
if is_darkmode() then
  darkmode = true
else
  darkmode = false
end

return {
  light_walpaper_path = light_wallpaper_path,
  dark_walpaper_paths = dark_wallpaper_path,
  darkmode_path = darkmode_path,
  is_darkmode = is_darkmode,
  darkmode = darkmode,
  sendto_bufnr = nil,
}
