local conf = require 'config'
local ju = require 'jutils'
local g = require 'globals'

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--- Randomizes the Background (uses feh)
local randomize_background = function()
  os.execute 'waldark'
end

--- Sets the theme to lightmode
local set_lightmode = function()
  vim.opt.background = 'light'
  os.execute "sed -i -- 's/dark/light/' ~/.scripts/.mode"
  require('misenplacecolors').load()
  vim.fn.setenv('LD_THEME', 'light')
  g.darkmode = false
end

local set_darkmode = function()
  vim.opt.background = 'dark'
  if ju.has_wal() and ju.exists(conf.default_dark_wallpaper) then
    os.execute('wal -i ' .. conf.default_dark_wallpaper .. ' >/dev/null')
  end
  os.execute "sed -i -- 's/light/dark/' ~/.scripts/.mode"
  require('misenplacecolors').load()
  g.darkmode = true
end

-- Set defaults
if g.darkmode then
  set_darkmode()
else
  set_lightmode()
end

--- Toggle darkmode
--- Sets LD_THEME environment variable,
--- runs waldark and sets colorscheme
local toggle_darkmode = function()
  -- Read in darkmode from file and toggle
  if g.darkmode then
    set_lightmode()
    -- vim.cmd[[colorscheme base16-one-light]]
  else
    set_darkmode()
    set_darkmode()
    -- vim.cmd[[colorscheme base16-material]]
  end
end

-- --- Sets the colorscheme to wal
-- local set_wal = function()
--   vim.o.colorscheme = 'wal'
-- end

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
