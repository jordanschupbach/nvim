-- https://github.com/ii14/neorepl.nvim
return {
  'ii14/neorepl.nvim',
  config = function()
    require('neorepl').config {
      lang = 'lua',
      inspect = true,
      indent = 1,
      startinsert = true,
      -- buffer = 0,
      on_init = nil,
      env_lua = nil,
      -- window = nil,
      histfile = '$XDG_STATE_HOME/neorepl_history' or '$XDG_CACHE_HOME/neorepl_history',
      histmax = 100,
    }
  end,
}
