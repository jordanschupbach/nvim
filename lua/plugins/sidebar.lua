return {
  'sidebar-nvim/sidebar.nvim',
  config = function()
    local section = {
      title = 'Section Title',
      icon = '->',
      setup = function(ctx) -- called only once and if the section is being used
      end,
      update = function(ctx)
        -- hook callback, called when an update was requested by either the user of external events (using autocommands)
      end,
      draw = function(ctx)
        return '> string here\n> multiline'
      end,
      -- highlights = {
      --   groups = { MyHighlightGroup = { gui="#C792EA", fg="#ff0000", bg="#00ff00" } },
      --   links = { MyHighlightGroupLink = "Keyword" }
      -- }
    }

    local sidebar = require 'sidebar-nvim'
    local opts = {
      open = false,
      disable_default_keybindings = 0,
      bindings = nil,
      side = 'right',
      initial_width = 35,
      hide_statusline = false,
      update_interval = 1000,
      section_separator = { '', '-----', '' },
      section_title_separator = { '' },
      containers = {
        attach_shell = '/bin/sh',
        show_all = true,
        interval = 5000,
      },
      datetime = {
        format = '%a %b %d, %H:%M',
        clocks = { { name = 'local' } },
      },
      sections = {
        -- "datetime",
        -- "git",
        -- "diagnostics" ,
        section,
        'todos',
        'symbols',
      },
      todos = {
        icon = '',
        ignored_paths = { '~' },
        initially_closed = false,
      },
      symbols = {
        icon = 'ƒ',
      },
    }
    sidebar.setup(opts)
  end,
}
