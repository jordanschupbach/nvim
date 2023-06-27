return {
  'jinzhongjia/LspUI.nvim',
  event = 'VeryLazy',
  config = function()
    require('LspUI').setup()
  end,
}
