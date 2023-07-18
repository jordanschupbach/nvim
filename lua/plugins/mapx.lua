-- https://github.com/b0o/mapx.nvim

return {
  'b0o/mapx.nvim',
  config = function()
    require('mapx').setup {}
  end,
  dependencies = {
    'nvim-telescope/telescope.nvim'
  }
}
