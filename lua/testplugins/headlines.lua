-- https://github.com/lukas-reineke/headlines.nvim
return {
  'lukas-reineke/headlines.nvim',
  -- init.lua
  config = function()
    require('lazy').setup {
      {
        'lukas-reineke/headlines.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = true, -- or `opts = {}`
      },
    }
  end,
}
