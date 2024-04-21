-- https://github.com/sidebar-nvim/sidebar.nvim

return {
  'sidebar-nvim/sidebar.nvim',
  requires = 'nvim-lua/plenary.nvim',
  -- Optional: needed for PHP when using the cobertura parser
  config = function()
    local sidebar = require 'sidebar-nvim'
    local opts = {

      disable_default_keybindings = 0,
      bindings = nil,
      open = false,
      side = 'right',
      initial_width = 35,
      hide_statusline = false,
      update_interval = 1000,
      sections = { 'datetime', 'git', 'diagnostics' },
      section_separator = { '', '-----', '' },
      section_title_separator = { '' },
      containers = {
        attach_shell = '/bin/sh',
        show_all = true,
        interval = 5000,
      },
      datetime = { format = '%a %b %d, %H:%M', clocks = { { name = 'local' } } },
      todos = { ignored_paths = { '~' } },
    }

    sidebar.setup(opts)
    require('coverage').setup {}
  end,
}
