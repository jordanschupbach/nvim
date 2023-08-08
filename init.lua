-- MisEnPlace

require('misenplacecolors').load()

-- Boostrap Lazy
require 'lazybootstrap'

-- pre-plugin requires
-- g = require('global-vars')
--- - local ju = require('jutils')
-- local config = require('config')
require 'vimopt'

-- require('plugin-free-commands')
-- require('global-vars')
-- Setup plugins using lazy
require('lazy').setup 'plugins'
require 'newtheme'

-- post-plugin requires
-- require 'lsp'
require 'mappings'
require 'commands'

local colors = require 'misenplacecolors.colors'

vim.fn.sign_define('DiagnosticHint', { text = 'h', fg = '#fedb00', bg = '#3e3333' })

-- print(vim.fn.stdpath('data'))
