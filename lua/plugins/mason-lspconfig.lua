-- https://github.com/williamboman/mason-lspconfig.nvim

return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'SmiteshP/nvim-navbuddy',
    'SmiteshP/nvim-navbuddy',
    'MunifTanjim/nui.nvim',
    'folke/neodev.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    -- local navbuddy = require 'nvim-navbuddy'

    local servers = {
      -- bashls = {},
      -- cmake = {},
      clangd = { },
      -- -- clojure_lsp = {},
      -- gopls = {},
      -- gradle_ls = {},
      -- -- -- haskel_language_server = {},
      -- -- fortls = {},
      -- -- -- elixerls = {},
      -- ltex = {
      --   on_attach = function(_, _) -- client, bufnr
      --   -- rest of your on_attach process.
      --   require('ltex_extra').setup {

      --       -- on_attach = on_attach, capabilities = capabilities,
      --       use_spellfile = false, filetypes = { 'latex', 'tex', 'bib',
      --         'markdown', 'gitcommit', 'text' }, settings = { ltex = { enabled
      --         = { 'latex', 'tex', 'bib', 'markdown' }, language = 'auto',
      --         diagnosticSeverity = 'information', sentenceCacheSize = 2000,
      --         additionalRules = { enablePickyRules = true, motherTongue = 'fr',
      --         }, disabledRules = { fr = { 'APOS_TYP', 'FRENCH_WHITESPACE' }, },
      --         dictionary = (function()
      --           -- For dictionary, search for files in the runtime to have and
      --           -- include them as externals the format for them is
      --           -- dict/{LANG}.txt
      --       --
      --           -- Also add dict/default.txt to all of them
      --           local files = {} for _, file in
      --             ipairs(vim.api.nvim_get_runtime_file('dict/*', true)) do
      --             local lang = vim.fn.fnamemodify(file, ':t:r') local fullpath
      --             = vim.fs.normalize(file, ':p') files[lang] = { ':' ..
      --               fullpath } end

      --           if files.default then for lang, _ in pairs(files) do if lang ~=
      --             'default' then vim.list_extend(files[lang], files.default)
      --           end end files.default = nil end return files end)(), }, }, }
      --   end,
      --   settings = {
      --     ltex = {},
      --   },
      -- },
      -- -- -- jdtls = {
      -- -- --   -- on_attach = function(client, bufnr)
      -- -- --   --     navbuddy.attach(client, bufnr)
      -- -- --   -- end
      -- -- -- },
      -- pyright = { },
      -- rust_analyzer = {},
      -- -- r_language_server = { },
      -- -- -- hls = {},
      -- -- tsserver = {},
      -- zls = {},
      lua_ls = require("lsp.lua-ls")
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Ensure the servers above are installed
    local mason_lspconfig = require('mason-lspconfig')

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
  end,
}
