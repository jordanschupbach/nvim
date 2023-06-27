return {
  'glepnir/lspsaga.nvim',
  -- Setup mason so it can manage external tooling
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup {}
  end,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    --Please make sure you install markdown and markdown_inline parser
    { 'nvim-treesitter/nvim-treesitter' },
  },
}
