-- https://github.com/shellRaining/hlchunk.nvim

return {
  'shellRaining/hlchunk.nvim',
  event = { 'UIEnter' },
  config = function()
    require('hlchunk').setup {}
  end,
}
