-- local navbuddy = require("nvim-navbuddy")

local servers = {
  bashls = {},
  cmake = {},
  clangd = {
    -- on_attach = function(client, bufnr)
    --     navbuddy.attach(client, bufnr)
    -- end
  },
  clojure_lsp = {},
  gopls = {},
  gradle_ls = {},
  -- haskel_language_server = {},
  fortls = {},
  -- elixerls = {},
  ltex = {
    on_attach = function(_, _) -- client, bufnr
      -- rest of your on_attach process.
      require('ltex_extra').setup {}
    end,
    settings = {
      ltex = {},
    },
  },

  jdtls = {
    -- on_attach = function(client, bufnr)
    --     navbuddy.attach(client, bufnr)
    -- end
  },
  pyright = {
    -- on_attach = function(client, bufnr)
    --     navbuddy.attach(client, bufnr)
    -- end
  },
  rust_analyzer = {},
  r_language_server = {
    -- on_attach = function(client, bufnr)
    --     navbuddy.attach(client, bufnr)
    -- end
  },
  -- hls = {},
  tsserver = {},
  zls = {},

  -- sumneko_lua = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
    -- on_attach = function(client, bufnr)
    --     navbuddy.attach(client, bufnr)
    -- end
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      -- on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
