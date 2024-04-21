-- https://github.com/sidebar-nvim/sidebar.nvim

return {
  'sidebar-nvim/sidebar.nvim',
  requires = 'nvim-lua/plenary.nvim',
  -- Optional: needed for PHP when using the cobertura parser
  config = function()
    local u = require 'utilities'
    local project = {
      title = 'Project',
      icon = '',
      setup = function(ctx) -- called only once and if the section is being used
      end,
      update = function(ctx)
        -- hook callback, called when an update was requested by either the user of external events (using autocommands)
      end,
      draw = function(ctx)
        local ret = ''
        ret = ret .. 'Name: ' .. vim.fn.getcwd():match '.*/(.*)' .. '\n'
        ret = ret .. 'Type: ' .. u.determine_project_type() .. '\n'
        ret = ret .. 'Coverage: 0' .. '/100%\n'
        ret = ret .. 'Tests: 0' .. '/37 passing\n'
        return ret
      end,
      -- highlights = {
      --   groups = { MyHighlightGroup = { gui="#C792EA", fg="#ff0000", bg="#00ff00" } },
      --   links = { MyHighlightGroupLink = "Keyword" }
      -- }
    }

    local sidebar = require 'sidebar-nvim'
    local opts = {

      disable_default_keybindings = 0,
      bindings = nil,
      open = false,
      side = 'right',
      initial_width = 35,
      hide_statusline = false,
      update_interval = 1000,
      sections = { project, 'git', 'diagnostics', 'todos' },
      section_separator = { '-----', '' },
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
