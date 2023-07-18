-- https://github.com/nvimdev/lspsaga.nvim

return {
  'glepnir/lspsaga.nvim',
  -- Setup mason so it can manage external tooling
  event = 'LspAttach',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    --Please make sure you install markdown and markdown_inline parser
    { 'nvim-treesitter/nvim-treesitter' },
  },
  config = function()
    require('lspsaga').setup {}
  end,
}
