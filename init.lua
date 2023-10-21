-- MisEnPlace

-- vim.loader.enable
require('misenplacecolors').load()

-- See (#1), there is no good readme. TODO(jordans1882)>

-- ls

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

-- local colors = require 'misenplacecolors.colors'

vim.fn.sign_define('DiagnosticHint', { text = 'h', fg = '#fedb00', bg = '#3e3333' })

local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end


-- print(vim.fn.stdpath('data'))
