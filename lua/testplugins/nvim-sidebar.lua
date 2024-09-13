-- https://github.com/sidebar-nvim/sidebar.nvim

return {
  'sidebar-nvim/sidebar.nvim',
  requires = 'nvim-lua/plenary.nvim',
  -- Optional: needed for PHP when using the cobertura parser
  config = function()
    local u = require 'utilities'
    local luv = vim.loop
    local Debouncer = require 'sidebar-nvim.debouncer'

    project_data = {}

    local async_get_project_string = function()
      local stdout = luv.new_pipe(false)
      local stderr = luv.new_pipe(false)
      local handle

      local get_project_string = function()
        local test_data = utils.parse_cpp_test_output ''
        local coverage_data = utils.parse_cpp_coverage_ouput()
        local lines = ''
        lines = lines .. 'Name: ' .. vim.fn.getcwd():match '.*/(.*)' .. '\n'
        lines = lines .. 'Type: ' .. u.determine_project_type() .. '\n'
        lines = lines .. 'Tests: ' .. test_data['passing'] .. '/' .. test_data['ntests'] .. ' passing\n'
        lines = lines .. 'Coverage: \n'
        lines = lines .. ' - line: ' .. coverage_data['lines'] .. '\n'
        lines = lines .. ' - func: ' .. coverage_data['functions'] .. '\n'

        local tlines = {}
        for line in lines:gmatch '[^\n]*' do
          table.insert(tlines, line)
        end
        local hl = {
          { 'Keyword', 0, 0, 5 },
          { 'Keyword', 1, 0, 5 },
          { 'Keyword', 2, 0, 5 },
          { 'Keyword', 3, 0, 5 },
        }

        local llines = {
          'Name: ' .. vim.fn.getcwd():match '.*/(.*)',
          'Type: ' .. u.determine_project_type(),
          'Tests: ' .. test_data['passing'] .. '/' .. test_data['ntests'] .. ' passing',
          'Coverage: ',
          ' - line: ' .. coverage_data['lines'],
          ' - func: ' .. coverage_data['functions'],
        }

        local lhl = {
          -- { 'Keyword', 0, 0, 5 },
          -- { 'Type', 0, 6, -1 },
          -- { 'Keyword', 1, 0, 5 },
          -- { 'Type', 1, 6, -1 },
        }

        project_data = { lines = llines, hl = lhl }
        -- project_data = { lines = llines, hl = lhl }
        -- project_data = lines
      end

      get_project_string()
      -- vim.schedule(get_project_string)
      -- handle = luv.spawn(cmd.bin, cmd.opts, function()
    end
    local project_debouncer

    local project = {
      title = 'Project',
      icon = '',
      setup = function(ctx) -- called only once and if the section is being used
        local interval = 100000
        project_debouncer = Debouncer:new(async_get_project_string, interval)
        project_debouncer:call()
      end,
      update = function(ctx)
        project_debouncer:call(ctx)
      end,
      draw = function(ctx)
        project_debouncer:call(ctx)
        return project_data
      end,
      highlights = {
        groups = { CustomHighlightGroupHello = { fg = '#00ff00', bg = '#0000ff' } },
        -- links = { MyHighlightGroupLink = "Keyword" }
      },
    }

    local sidebar = require 'sidebar-nvim'
    local opts = {

      disable_default_keybindings = 0,
      bindings = nil,
      open = false,
      side = 'right',
      initial_width = 25,
      hide_statusline = false,
      update_interval = 1000,
      sections = { project, 'todos', 'diagnostics', 'git' },
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
