-- vim.api.nvim_create_augroup('LspAttach_inlayhints', {})
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = 'LspAttach_inlayhints',
--   callback = function(args)
--     if not (args.data and args.data.client_id) then
--       return
--     end
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     require('lsp-inlayhints').on_attach(client, bufnr, true)
--   end,
-- })

-- vim.api.nvim_create_augroup('FormatAutogroup', {})
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   group = 'FormatAutogroup',
--   callback = function()
--     vim.cmd 'FormatWrite'
--   end,
-- })

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})

vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  callback = function()
    vim.cmd 'set nomodified'
  end,
})

-- Return to last edit position when opening files
vim.cmd [[
augroup augroup_all_files_vimscript
  autocmd!
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup END
]]

-- Auto-reload buffer on BufEnter
vim.cmd [[
    augroup AutoReload
        autocmd!
        autocmd BufEnter * :checktime
    augroup END
]]

-- vim.api.nvim_buf_create_user_command('Format', function()
--   vim.lsp.buf.format() end, { desc = 'Format current buffer with LSP' })
