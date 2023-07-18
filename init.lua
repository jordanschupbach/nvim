-- MisEnPlace


-- Boostrap Lazy
require('lazybootstrap')

-- pre-plugin requires
-- g = require('global-vars')
--- - local ju = require('jutils')
-- local config = require('config')
require('vimopt')

-- require('plugin-free-commands')
-- require('global-vars')
-- Setup plugins using lazy
require('lazy').setup('plugins')
require('newtheme')

-- post-plugin requires
-- require 'lsp'
require 'mappings'

-- print(vim.fn.stdpath('data'))
