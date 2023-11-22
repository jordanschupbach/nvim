-- https://github.com/quarto-dev/quarto-nvim

return {
  'quarto-dev/quarto-nvim',
  config = function()
    require('quarto').setup {
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        languages = { 'r', 'python', 'julia', 'bash', 'cpp' },
        chunks = 'curly', -- 'curly' or 'all'
        diagnostics = {
          enabled = true,
          triggers = { 'BufWritePost' },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        hover = 'K',
        definition = 'gd',
        rename = '<leader>lR',
        references = 'gr',
      },
    }
  end,
  dependencies = {
    'quarto-dev/quarto-nvim',
    'jmbuhr/otter.nvim',
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
}
