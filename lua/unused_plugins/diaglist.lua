-- https://github.com/onsails/diaglist.nvim

return {
  'onsails/diaglist.nvim',
  config = function()
    require('diaglist').init {
      -- optional settings
      -- below are defaults
      debug = true,

      -- increase for noisy servers
      debounce_ms = 150,
    }
  end,
}
