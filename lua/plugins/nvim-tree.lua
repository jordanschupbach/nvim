-- https://github.com/nvim-tree/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly', -- optional, updated every week. (see issue #1193)
  keys = {
    { '<localleader>ff', '<cmd>NvimTreeToggle<cr>', desc = 'File Tree' },
  },
  cmd = { 'NvimTreeToggle' },
  opts = {
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    update_cwd = false,
    sort_by = 'case_sensitive',
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 400,
    },
    view = {
      width = 25,
      preserve_window_proportions = true,
      adaptive_size = false,
      mappings = {
        list = {
          { key = 'u', action = 'dir_up' },
        },
      },
    },
    renderer = {
      group_empty = true,
    },

    filesystem = {
      window = {
        mappings = {
          ['<leader>r'] = 'system_open',
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          path = vim.fn.shellescape(path, 1)
          if vim.fn.has 'win64' ~= 0 then
            cmd('!start "" ' .. selected_entry[1])
          elseif vim.fn.has 'linux' ~= 0 then
            cmd('!xdg-open ' .. selected_entry[1])
          end
        end,
      },
    },

    -- filters = {
    --   dotfiles = true,
    -- },
  },
}
