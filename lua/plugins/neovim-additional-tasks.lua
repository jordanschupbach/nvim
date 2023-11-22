-- https://github.com/athanase/neovim-additional-tasks/blob/master/README.md

return {
  'DoDoENT/neovim-additional-tasks',
  dependencies = {
    { 'Shatur/neovim-tasks', requires = { 'nvim-lua/plenary.nvim' } },
    'neovim/nvim-lspconfig',
  },
}
