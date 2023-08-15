local utilities = require 'utilities'

g = require 'globals'

local Darkmode = true

vim.cmd [[highlight Headline1 guibg=#1e2718]]
vim.cmd [[highlight Headline2 guibg=#21262d]]
vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]

local set_lightmode = function()
  vim.opt.background = 'light'
  require 'misenplacecolors'
  vim.fn.setenv('LD_THEME', 'light')
  os.execute "export LD_THEME='light'"
  -- os.execute 'waldark --light'
  os.execute "sed -i -- 's/dark/light/' ~/.scripts/.mode"
  Darkmode = false
  g.darkmode = false
end

local set_darkmode = function()
  vim.opt.background = 'dark'
  vim.cmd [[colorscheme kanagawa-wave]]
  vim.fn.setenv('LD_THEME', 'dark')
  os.execute "export LD_THEME='dark'"
  -- os.execute 'waldark --dark'
  -- os.execute 'wal -i /home/jordan/wallpapers/dark_wallpapers/neon-cyberpunk-wallpaper.jpg'
  os.execute "sed -i -- 's/light/dark/' ~/.scripts/.mode"
  Darkmode = true
  g.darkmode = true
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

local set_wal = function()
  vim.o.colorscheme = 'wal'
end

vim.api.nvim_create_user_command('RandomizeBG', function()
  randomize_background()
end, {
  desc = 'Set Light Mode',
})

vim.api.nvim_create_user_command('SetDarkMode', function()
  ju.set_darkmode()
end, {
  desc = 'Set Dark Mode',
})

vim.api.nvim_create_user_command('SetLightMode', function()
  ju.set_lightmode()
end, {
  desc = 'Set Light Mode',
})

vim.api.nvim_create_user_command('ToggleDarkMode', function()
  ju.toggle_darkmode()
end, {
  desc = 'Toggle Dark Mode',
})

-- set_wal()

local dmode = utilities.lines_from '/home/jordan/.scripts/.mode'

if dmode[1] == 'dark' then
  Darkmode = true
  set_darkmode()
  print 'was dark'
else
  Darkmode = false
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

vim.highlight.create('DapBreakpoint', { ctermbg = 0, guifg = '#993939', guibg = '#31353f' }, false)
vim.highlight.create('DapLogPoint', { ctermbg = 0, guifg = '#61afef', guibg = '#31353f' }, false)
vim.highlight.create('DapStopped', { ctermbg = 0, guifg = '#98c379', guibg = '#31353f' }, false)

vim.fn.sign_define(
  'DapBreakpoint',
  { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' }
)
vim.fn.sign_define(
  'DapBreakpointCondition',
  { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' }
)
vim.fn.sign_define(
  'DapBreakpointRejected',
  { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' }
)
vim.fn.sign_define(
  'DapLogPoint',
  { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' }
)
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
