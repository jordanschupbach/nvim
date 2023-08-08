return { -- This plugin
  'Zeioth/compiler.nvim',
  cmd = { 'CompilerOpen', 'CompilerToggleResults' },
  dependencies = { 'stevearc/overseer.nvim' },
  config = function(_, opts)
    require('compiler').setup(opts)
  end,
}
