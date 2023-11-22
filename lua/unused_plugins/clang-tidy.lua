-- https://github.com/emilienlemaire/clang-tidy.nvim

return {
  'emilienlemaire/clang-tidy.nvim',
  config = function()
    require('clang-tidy').setup {
      cmd = 'clang-tidy', -- The clang-tidy command
      checks = { '*' }, -- An array of clang-tidy checks
      args = {}, -- An array clang-tidy launching args
      cwd = vim.loop.cwd, -- Function: the function to execute to get the cwd
      ignore_severity = {
        'note',
      }, -- An array of severity that you don't wish to publish  end,
    }
  end,
}
