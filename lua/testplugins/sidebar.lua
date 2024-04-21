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
      diagnostics = {
        icon = '',
      },

      open = false,
      disable_default_keybindings = 0,
      bindings = nil,
      side = 'right',
      initial_width = 28,
      hide_statusline = false,
      update_interval = 1000,
      section_separator = { '', '-----' },
      section_title_separator = {},
      datetime = {
        format = '%a %b %d, %H:%M',
        clocks = { { name = 'local' } },
      },
      sections = {
        -- "datetime",
        -- "git",
        'diagnostics',
        'containers',
        -- section,
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
      containers = {
        icon = '',
        use_podman = false,
        attach_shell = '/bin/sh',
        show_all = true, -- whether to run `docker ps` or `docker ps -a`
        interval = 5000, -- the debouncer time frame to limit requests to the docker daemon
      },
    }
    sidebar.setup(opts)
  end,
}

--   {
--     'sidebar-nvim/sidebar.nvim',
--     config = function()
--       local sidebar = require 'sidebar-nvim'
--       local opts = {
--         open = true,
--         side = 'right',
--         sections = { 'datetime', 'git', 'diagnostics', 'todos', 'symbols' },
--         todos = {
--           icon = '',
--           ignored_paths = { '~' }, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
--           initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
--         },
--         symbols = {
--           icon = 'ƒ',
--         },
--       }
--       sidebar.setup(opts)
--     end,
--   },
