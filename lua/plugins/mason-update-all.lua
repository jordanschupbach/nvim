return {
  'RubixDev/mason-update-all',
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require('mason-update-all').setup()
  end,
}
