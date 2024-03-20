--- https://github.com/rossjaywill/insights.nvim

return {
  'rossjaywill/insights.nvim',
  config = function()
    require('insights').setup {
      async = false, -- do not use plenary
      use_default_keymaps = false, -- disable default keymaps, to be user defined
      use_libc = false, -- do not use libc++ headers
    }
  end,
}
