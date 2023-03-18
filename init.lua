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
require 'options'
-- require('autocommands')
-- require('dicthover')
-- require('rebuildjdtls')

-- Setup plugins using lazy
require('lazy').setup 'plugins'

require 'mappings'
-- Setup lsp (after lazy)
require 'lsp'
require 'utilities'

-- TODO: move this somewhere
vim.cmd [[highlight Headline1 guibg=#1e2718]]
vim.cmd [[highlight Headline2 guibg=#21262d]]
vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]

require 'theme'

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

-- vim.cmd [[colorscheme onedark]] -- TODO: move me into post plugin require? (or add to base16 config?

-- vim: ts=2 sts=2 sw=2 et
