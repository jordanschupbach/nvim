-- MisEnPlace
-- my nvim configuration

-- Lazy bootstrap
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- pre-lazy requires
require 'vimopt'

-- Setup plugins using lazy
require('lazy').setup 'plugins'

-- Setup lsp (after lazy)
require 'lsp'
require 'utilities'

require 'theme'

vim.api.nvim_create_augroup('LspAttach_inlayhints', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'LspAttach_inlayhints',
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require('lsp-inlayhints').on_attach(client, bufnr, true)
  end,
})

-- hover = require("hover")

require('lspconfig').hls.setup {}
require('lspconfig').r_language_server.setup {}

-- Setup mappings last
require 'mappings'

-- vim: ts=2 sts=2 sw=2 et
