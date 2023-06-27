return {
  'barreiroleo/ltex_extra.nvim',
  ft = { 'markdown', 'tex' },
  dependencies = { 'neovim/nvim-lspconfig' },
  -- yes, you can use the opts field, just I'm showing the setup explicitly
  config = function()
    require('ltex_extra').setup {
      server_opts = {
        -- e.g. shared files for all projects :  vim.fn.expand("~") .. "/.local/share/ltex"
        -- path = vim.fn.expand("~") .. "/.config/nvim/spell",
        -- path = vim.fn.expand("~") .. "/.config/nvim/spell/en.utf-8.add",
        -- capabilities = your_capabilities,
        on_attach = function(client, bufnr)
          -- your on_attach process
        end,
        settings = {
          ltex = {
            load_langs = {}, -- en-US as default
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
      },
    }
  end,
}
