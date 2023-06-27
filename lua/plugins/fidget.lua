-- https://github.com/folke/lazy.nvim

return {
  'j-hui/fidget.nvim',
  tag = 'legacy',
  config = function()
    require('fidget').setup()
  end,
}
