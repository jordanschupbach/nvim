local conf = require('config')
local ju = require('jutils')
local g = require('global-vars')


local randomize_background = function()
  os.execute 'waldark'
end

local set_lightmode = function ()
  vim.opt.background = 'light'
  local kanagawa_loaded, _ = pcall(require, 'kanagawa')
  if kanagawa_loaded then
    vim.cmd [[colorscheme kanagawa]]
  else
    vim.cmd [[colorscheme zellner]]
  end
  -- vim.cmd [[colorscheme zellner]]
  vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
  vim.fn.setenv('LD_THEME', 'light')
  if (ju.exists(conf.default_light_wallpaper) and g.darkmode) then
	  os.execute('DISPLAY=:0 feh --bg-scale ' .. conf.default_light_wallpaper)
  else
    randomize_background()
  end
  if (ju.has_wal() and ju.exists(conf.default_light_wallpaper)) then
	  os.execute('wal -l -i ' .. conf.default_light_wallpaper .. ' >/dev/null')
  end
  os.execute("sed -i -- 's/dark/light/' ~/.scripts/.mode")
  g.darkmode = false
end

local set_darkmode = function()
  vim.opt.background = 'dark'
  local kanagawa_loaded, _ = pcall(require, 'kanagawa')
  if kanagawa_loaded then
    vim.cmd [[colorscheme kanagawa-wave]]
  else
    vim.cmd [[colorscheme slate]]
  end
  -- vim.cmd [[colorscheme slate]]
  vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
  if (ju.exists(conf.default_dark_wallpaper) and not g.darkmode) then
	  os.execute('DISPLAY=:0 feh --bg-scale ' .. conf.default_dark_wallpaper)
  else
    randomize_background()
  end
  if (ju.has_wal() and ju.exists(conf.default_dark_wallpaper)) then
	  os.execute('wal -i ' .. conf.default_dark_wallpaper .. ' >/dev/null')
  end
  os.execute("sed -i -- 's/light/dark/' ~/.scripts/.mode")
  g.darkmode = true
end


-- Set defaults
if(g.darkmode) then
	set_darkmode()
else
	set_lightmode()
end


-- Toggle darkmode
--- Sets LD_THEME environment variable,
--runs waldark and sets colorscheme
local toggle_darkmode = function()
  -- Read in darkmode from file and toggle
  if g.darkmode then
    set_lightmode()
    -- vim.cmd[[colorscheme base16-one-light]]
  else
    set_darkmode()
    -- vim.cmd[[colorscheme base16-material]]
  end
end


local set_wal = function()
  vim.o.colorscheme = 'wal'
end


vim.api.nvim_create_user_command('RandomizeBG', function()
  randomize_background()
end, {
  desc = 'Set Light Mode',
})

vim.api.nvim_create_user_command('DarkMode', function()
  set_darkmode()
end, {
  desc = 'Set Dark Mode',
})

vim.api.nvim_create_user_command('LightMode', function()
  set_lightmode()
end, {
  desc = 'Set Light Mode',
})

vim.api.nvim_create_user_command('ToggleDarkMode', function()
  toggle_darkmode()
end, {
  desc = 'Toggle Dark Mode',
})


-- set_wal()

local dmode = ju.lines_from('/home/jordan/.scripts/.mode')




-- print(dmode[1])

-- if dmode[1] == 'dark' then
--   g.darkmode = true -- TODO: Load this from a cache
--   set_darkmode()
--   print 'was dark'
-- else
--   Darkmode = false -- TODO: Load this from a cache
--   set_lightmode()
--   print 'was light'
-- end
--
-- if Darkmode then
--   vim.cmd [[highlight FidgetTitle ctermfg=110 guifg=#1e1c16 guibg=#1e1c16]]
--   vim.cmd [[highlight FidgetTask ctermfg=110 guifg=#1e1c16 guibg=#1e1c16]]
-- else
--   vim.cmd [[highlight FidgetTitle ctermfg=110 guifg=#cccccc guibg=#cccccc]]
--   vim.cmd [[highlight FidgetTask ctermfg=110 guifg=#cccccc guibg=#cccccc]]
-- end
