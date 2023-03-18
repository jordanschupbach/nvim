return { 'williamboman/mason.nvim',
  -- Setup mason so it can manage external tooling
  config = function()
    require('mason').setup()
  end,
}
