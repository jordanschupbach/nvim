-- local navbuddy = require("nvim-navbuddy")

local servers = {
  bashls = {},
  cmake = {},
  -- clangd = {
  --   -- on_attach = function(client, bufnr)
  --   --     navbuddy.attach(client, bufnr)
  --   -- end
  -- },

  clangd = {
    cmd = 'clangd -std=c++20 -stdlib=libstdc++ -I/usr/include/gismo/',
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' }, --  'proto'
    single_file_support = true,
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
      require('ltex_extra').setup {

        -- e.g. shared files for all projects :  vim.fn.expand("~") .. "/.local/share/ltex"
        -- path = vim.fn.expand("~") .. "/.config/nvim/spell",
        -- path = vim.fn.expand("~") .. "/.config/nvim/spell/en.utf-8.add",
        -- capabilities = your_capabilities,
        on_attach = function(client, bufnr)
          -- your on_attach process
        end,
        settings = {
          ltex = {
            load_langs = { 'en-US' }, -- en-US as default
            -- boolean : whether to load dictionaries on startup
            init_check = true,
            -- string : relative or absolute paths to store dictionaries
            -- e.g. subfolder in current working directory: ".ltex"
            -- e.g. shared files for all projects :  vim.fn.expand("~") .. "/.local/share/ltex"
            path = '', -- current working directory
            -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
            log_level = 'none',
            -- table : configurations of the ltex language server.
            -- Only if you are calling the server from ltex_extra
            server_opts = nil,
          },
        },
      }
    end,
    settings = {
      ltex = {},
    },
  },

  -- jdtls = {
  --   -- on_attach = function(client, bufnr)
  --   --     navbuddy.attach(client, bufnr)
  --   -- end
  -- },
  pyright = {
    -- on_attach = function(client, bufnr)
    --     navbuddy.attach(client, bufnr)
    -- end
  },
  rust_analyzer = {},
  r_language_server = {
    cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
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
      disable = { 'lowercase-global' },
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

local configs = require 'lspconfig.configs'
local nvim_lsp = require 'lspconfig'
if not configs.neocmake then
  configs.neocmake = {
    default_config = {
      cmd = { 'neocmakelsp', '--stdio' },
      filetypes = { 'cmake' },
      root_dir = function(fname)
        return nvim_lsp.util.find_git_ancestor(fname)
      end,
      single_file_support = true, -- suggested
      on_attach = on_attach, -- on_attach is the on_attach function you defined
      init_options = {
        format = {
          enable = true,
        },
        scan_cmake_in_package = true, -- default is true
      },
    },
  }
  nvim_lsp.neocmake.setup {}
end
