local jdtls_config = require("lsp.jdtls").setup()
local pkg_status, jdtls = pcall(require,"jdtls")
if not pkg_status then
  vim.notify("unable to load nvim-jdtls", 1)
  return
end

jdtls.start_or_attach(jdtls_config)


-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--
-- -- local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--
-- local config = {
--   cmd = {
--     'java',
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.level=ALL',
--     '-noverify', -- deprecated?
--     '-Xmx1G',
--     --add-modules=ALL-SYSTEM
--     --add-opens java.base/java.util=ALL-UNNAMED
--     --add-opens java.base/java.lang=ALL-UNNAMED
--     '-jar /usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--     '-configuration',
--     '/usr/share/java/jdtls/config_linux/',
--     '-data',
--     '~/.cache/',
--   },
--   root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' },
--   capabilities = capabilities,
--   settings = {
--     java = { signatureHelp = { enabled = true }, contentProvider = { preferred = 'fernflower' } },
--   },
--   -- on_init = function(client)
--   --   if client.config.settings then
--   --     client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
--   --   end
--   -- end,
-- }
-- require('jdtls').start_or_attach(config)
--
-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<C-;>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- vim.api.nvim_set_keymap(
--   'n',
--   '<leader>wl',
--   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
--   opts
-- )
-- vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostics.show_line_diagnostics()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostics.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostics.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostics.set_loclist()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)()<CR>', opts)
--
-- vim.api.nvim_set_keymap('n', '<leader>lA', "<cmd>lua require('jdtls').code_action()<CR>", opts)
