return {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "tex" },
    dependencies = { "neovim/nvim-lspconfig" },
    -- yes, you can use the opts field, just I'm showing the setup explicitly
    config = function()
        require("ltex_extra").setup {
            server_opts = {
                -- e.g. shared files for all projects :  vim.fn.expand("~") .. "/.local/share/ltex"
                path = vim.fn.expand("~") .. "/.config/nvim/spell",
                -- capabilities = your_capabilities,
                on_attach = function(client, bufnr)
                    -- your on_attach process
                end,
                settings = {
                    ltex = {}
                }
            },
        }
    end
}
