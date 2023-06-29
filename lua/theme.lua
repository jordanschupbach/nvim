local utilities = require 'utilities'

local Darkmode = true

vim.cmd [[highlight Headline1 guibg=#1e2718]]
vim.cmd [[highlight Headline2 guibg=#21262d]]
vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]

local set_lightmode = function()
  vim.opt.background = 'light'
  vim.cmd [[colorscheme kanagawa-lotus]]
  vim.fn.setenv('LD_THEME', 'light')
  os.execute "export LD_THEME='light'"
  os.execute 'waldark --light'
  os.execute "sed -i -- 's/dark/light/' ~/.scripts/.mode"
  Darkmode = false
end

local set_darkmode = function()
  vim.opt.background = 'dark'
  vim.cmd [[colorscheme kanagawa-wave]]
  vim.fn.setenv('LD_THEME', 'dark')
  os.execute "export LD_THEME='dark'"
  os.execute 'waldark --dark'
  os.execute "sed -i -- 's/light/dark/' ~/.scripts/.mode"
  Darkmode = true
end

local randomize_background = function()
  os.execute 'waldark'
end

-- Toggle darkmode
--- Sets LD_THEME environment variable,
--runs waldark and sets colorscheme
local toggle_darkmode = function()
  -- Read in darkmode from file and toggle
  if Darkmode then
    set_lightmode()
    -- vim.cmd[[colorscheme base16-one-light]]
  else
    set_darkmode()
    -- vim.cmd[[colorscheme base16-material]]
  end
end

vim.api.nvim_create_user_command('ToggleDarkMode', function()
  toggle_darkmode()
end, {
  desc = 'Toggle Dark Mode',
})

vim.api.nvim_create_user_command('SetDarkMode', function()
  set_darkmode()
end, {
  desc = 'Set Dark Mode',
})

vim.api.nvim_create_user_command('SetLightMode', function()
  set_lightmode()
end, {
  desc = 'Set Light Mode',
})

vim.api.nvim_create_user_command('RandomizeBG', function()
  randomize_background()
end, {
  desc = 'Set Light Mode',
})

local set_wal = function()
  vim.o.colorscheme = 'wal'
end

set_wal()

local dmode = utilities.lines_from '/home/jordan/.scripts/.mode'

if dmode[1] == 'dark' then
  Darkmode = true -- TODO: Load this from a cache
  set_darkmode()
  print 'was dark'
else
  Darkmode = false -- TODO: Load this from a cache
  set_lightmode()
  print 'was light'
end

if Darkmode then
  vim.cmd [[highlight FidgetTitle ctermfg=110 guifg=#1e1c16 guibg=#1e1c16]]
  vim.cmd [[highlight FidgetTask ctermfg=110 guifg=#1e1c16 guibg=#1e1c16]]
else
  vim.cmd [[highlight FidgetTitle ctermfg=110 guifg=#cccccc guibg=#cccccc]]
  vim.cmd [[highlight FidgetTask ctermfg=110 guifg=#cccccc guibg=#cccccc]]
end
