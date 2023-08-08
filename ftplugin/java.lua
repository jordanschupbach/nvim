local jdtls_config = require('lsp.jdtls').setup()

local pkg_status, jdtls = pcall(require, 'jdtls')
if not pkg_status then
  vim.notify('unable to load nvim-jdtls', 1)
  return
end

require('jdtls').start_or_attach(jdtls_config)

-- local opts = {
--     -- init_options = {
--     -- bundles = bundles
--     -- },
--   cmd = {'/usr/bin/jdtls'},
--   settings = {
--     java = {
--
--       single_file_support = true,
--       signatureHelp = { enabled = true },
--       completion = {
--         favoriteStaticMembers = {},
--         filteredTypes = {
--           -- "com.sun.*",
--           -- "io.micrometer.shaded.*",
--           -- "java.awt.*",
--           -- "jdk.*",
--           -- "sun.*",
--         },
--       },
--       sources = {
--         organizeImports = {
--           starThreshold = 9999,
--           staticStarThreshold = 9999,
--         },
--       },
--       codeGeneration = {
--         toString = {
--           template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
--         },
--         useBlocks = true,
--       },
--       configuration = {
--         runtimes = {
--           {
--             name = "JavaSE-1.8",
--             path = "/usr/lib/jvm/java-8-openjdk/",
--             -- path = "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home",
--             -- default = true,
--           },
--           {
--             name = "JavaSE-17",
--             path = "/usr/lib/jvm/java-17-openjdk/",
--             -- path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
--           },
--           {
--             name = "JavaSE-18",
--             path = "/usr/lib/jvm/java-18-openjdk/",
--             -- path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
--             default = true,
--           },
--           {
--             name = "JavaSE-20",
--             path = "/usr/lib/jvm/java-20-openjdk/",
--             -- path = "/Library/Java/JavaVirtualMachines/jdk-19.jdk/Contents/Home",
--           },
--         },
--       },
--       capabilities = require('cmp_nvim_lsp').default_capabilities(),
--     },
--   },
-- }
--
--   local pkg_status, jdtls = pcall(require,"jdtls")
--   if not pkg_status then
--     vim.notify("unable to load nvim-jdtls", "error")
--     return {}
--   end
--
--
--
--   local root_markers = {"gradlew", ".git" }
--   local jdtls_bin = "/usr/bin/jdtls"
--   local root_dir = jdtls.setup.find_root(root_markers)
--   local home = os.getenv("HOME")
--   local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
--   local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name
-- opts.cmd = {
--   jdtls_bin,
--   "-configuration /home/jordan/.cache/jdtls/config",
--   "-data",
--   workspace_dir,
-- }
--
--   -- local on_attach = function(_, _)
--   --   -- jdtls.setup.add_commands() -- important to ensure you can update configs when build is updated (deprecated?)
--   --   -- if you setup DAP according to https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration you can uncomment below
--   --   -- jdtls.setup_dap({ hotcodereplace = "auto" })
--   --   -- require('dap.ext.vscode').load_launchjs()
--   --   -- jdtls.dap.setup_dap_main_class_configs()
--
--   --   -- you may want to also run your generic on_attach() function used by your LSP config
--   -- end
--
--   -- opts.on_attach = on_attach
--   opts.capabilities = vim.lsp.protocol.make_client_capabilities()
--
--
-- opts['on_attach'] = function(client, bufnr)
--   -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
--   -- you make during a debug session immediately.
--   -- Remove the option if you do not want that.
--   -- require('jdtls').setup_dap({ hotcodereplace = 'auto' })
-- end
--
--
--
-- -- local function setup()
-- --   local pkg_status, jdtls = pcall(require,"jdtls")
-- --   if not pkg_status then
-- --     vim.notify("unable to load nvim-jdtls", "error")
-- --     return {}
-- --   end
--
--   -- local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
--   -- local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
-- -- local jdtls_bin = "/usr/bin/jdtls"
--
--
--
-- -- local config = {
-- --     cmd = {'/usr/bin/jdtls'},
-- --     root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
-- -- }
-- --
-- --
-- --
-- --
--
-- -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- local config = {
--   -- The command that starts the language server
--   -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--   cmd = {
--
--     -- 💀
--     'java', -- or '/path/to/java17_or_newer/bin/java'
--             -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.protocol=true',
--     '-Dlog.level=ALL',
--     '-Xmx1g',
--     '--add-modules=ALL-SYSTEM',
--     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--
--     -- 💀
--     '-jar', '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
--          -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
--          -- Must point to the                                                     Change this to
--          -- eclipse.jdt.ls installation                                           the actual version
--
--
--     -- 💀
--     '-configuration', '/path/to/jdtls_install_location/config_SYSTEM',
--                     -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
--                     -- Must point to the                      Change to one of `linux`, `win` or `mac`
--                     -- eclipse.jdt.ls installation            Depending on your system.
--
--
--     -- 💀
--     -- See `data directory configuration` section in the README
--     '-data', '/path/to/unique/per/project/workspace/folder'
--   },
--
--   -- 💀
--   -- This is the default if not provided, you can remove it. Or adjust as needed.
--   -- One dedicated LSP server & client will be started per unique root_dir
--   root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
--
--   -- Here you can configure eclipse.jdt.ls specific settings
--   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--   -- for a list of options
--   settings = {
--     java = {
--     }
--   },
--
--   -- Language server `initializationOptions`
--   -- You need to extend the `bundles` with paths to jar files
--   -- if you want to use additional eclipse.jdt.ls plugins.
--   --
--   -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--   --
--   -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
--   init_options = {
--     bundles = {}
--   },
-- }
-- -- This starts a new client & server,
-- -- or attaches to an existing client & server depending on the `root_dir`.
-- require('jdtls').start_or_attach(config)
--
--
--
--
--
-- require('jdtls').start_or_attach(opts)

vim.api.nvim_set_keymap(
  'n',
  '<localleader>lA',
  "<cmd>lua require('jdtls').code_action()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<localleader>lo',
  "<Cmd>lua require'jdtls'.organize_imports()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  'crv',
  "<Cmd>lua require('jdtls').extract_variable()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'v',
  'crv',
  "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'v',
  'crc',
  "<Cmd>lua require('jdtls').extract_constant()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'v',
  'crv',
  "<Esc><Cmd>lua require('jdtls').extract_constant()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'v',
  'crm',
  "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
  { noremap = true, silent = true }
)

-- " If using nvim-dap
-- " This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
vim.api.nvim_set_keymap(
  'n',
  '<leader>df',
  "<Cmd>lua require'jdtls'.test_class()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>dn',
  "<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
  { noremap = true, silent = true }
)

-- function nnoremap(rhs, lhs, bufopts, desc)
--   bufopts.desc = desc
--   vim.keymap.set("n", rhs, lhs, bufopts)
-- end

-- -- nvim-dap
-- nnoremap("<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Set breakpoint")
-- nnoremap("<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Set conditional breakpoint")
-- nnoremap("<leader>dl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Set log point")
-- nnoremap('<leader>dr', "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear breakpoints")
-- nnoremap('<leader>da', '<cmd>Telescope dap list_breakpoints<cr>', "List breakpoints")
--
-- nnoremap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>", "Continue")
-- nnoremap("<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", "Step over")
-- nnoremap("<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", "Step into")
-- nnoremap("<leader>do", "<cmd>lua require'dap'.step_out()<cr>", "Step out")
-- nnoremap('<leader>dd', "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect")
-- nnoremap('<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", "Terminate")
-- nnoremap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "Open REPL")
-- nnoremap("<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", "Run last")
-- nnoremap('<leader>di', function() require"dap.ui.widgets".hover() end, "Variables")
-- nnoremap('<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end, "Scopes")
-- nnoremap('<leader>df', '<cmd>Telescope dap frames<cr>', "List frames")
-- nnoremap('<leader>dh', '<cmd>Telescope dap commands<cr>', "List commands")

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities()

-- -- Ensure the servers above are installed
-- local mason_lspconfig = require('mason-lspconfig')

-- local on_attach = function()
--     jdtls.setup_dap({ hotcodereplace = "auto" })
--     require('dap.ext.vscode').load_launchjs()
--     -- jdtls.dap.setup_dap_main_class_configs()
-- end

-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       -- on_attach = on_attach,
--       settings = servers[server_name],
--     }
--   end,
-- }

-- require('jdtls.dap').setup_dap_main_class_configs()

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--
-- -- local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--
--
-- local config = {
--   init_options = {
--     bundles = bundles
--   },
--   cmd = {
--     'java',
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.level=ALL',
--     -- '-noverify', -- deprecated?
--     -- '-Xmx1G',
--     --add-modules=ALL-SYSTEM
--     --add-opens java.base/java.util=ALL-UNNAMED
--     --add-opens java.base/java.lang=ALL-UNNAMED
--     '-jar /usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar',
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
--   -- on_attach = on_attach,
--   -- on_init = function(client)
--   --   if client.config.settings then
--   --     client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
--   --   end
--   -- end,
-- }
-- require('jdtls').start_or_attach(config)

-- jdtls.dap.setup_dap_main_class_configs()
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
