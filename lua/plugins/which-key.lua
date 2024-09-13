-- https://github.com/folke/which-key.nvim

return {
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup {

      --- {{{ Plugin Config

      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = 'Comments' },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
      },
      window = {
        border = 'none', -- none, single, double, shadow
        position = 'bottom', -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = 'left', -- align columns left, center or right
      },
      ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
      hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      show_keys = true, -- show the currently pressed key and its label as a message in the command line
      triggers = 'auto', -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { 'j', 'k' },
        v = { 'j', 'k' },
      },
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by deafult for Telescope
      disable = {
        buftypes = {},
        filetypes = { 'TelescopePrompt' },
      },
    }

    --- }}} Plugin Config

    local wk = require 'which-key'

    --     -- {{{ Harpoon
    --     wk.register {
    --       { '<leader>h', group = 'Harpoon' },
    --       { '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', desc = 'Add' },
    --       { '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = 'Harpoon' },
    --       { '<leader>hj', ':lua require("harpoon.ui").nav_next()<CR>', desc = 'Next' },
    --       { '<leader>hk', ':lua require("harpoon.ui").nav_prev()<CR>', desc = 'Previous' },
    --     }
    --     -- }}} Harpoon
    --
    --     -- {{{ Marks
    --     wk.register {
    --       { '<leader>m', group = 'Mark' },
    --       { '<leader>mm', ':MyJumpMarks<CR>', desc = 'Marks' },
    --     }
    --     -- }}} Marks
    --
    --     -- {{{ Marks
    --     wk.register {
    --       { '<leader>p', group = 'Project' },
    --       { '<leader>pb', '<cmd>BuildMe<cr>', desc = 'Build' },
    --       { '<leader>pf', '<cmd>Telescope find_files hidden=true no_ignore=true theme=ivy<cr>', desc = 'Files' },
    --       { '<leader>pr', '<cmd>Telescope live_grep theme=ivy<cr>', desc = 'Grep' },
    --       { '<leader>ps', '<cmd>split<CR>:terminal<cr>', desc = 'Shell' },
    --       { '<leader>po', '<cmd>Telescope project theme=ivy<cr>', desc = 'Open' },
    --       { '<leader>pp', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
    --     }
    --     -- }}} Marks

    wk.register({
      -- {{{ Project
      p = {
        name = 'project', -- group name
        b = { ':BuildMe<cr>', 'Build' },
        f = { ':Telescope find_files hidden=true no_ignore=true theme=ivy<cr>', 'Files' },
        r = { ':Telescope live_grep theme=ivy<cr>', 'Grep' },
        s = { ':split<CR>:terminal<cr>', 'Shell' },
        o = { ':Telescope project theme=ivy<cr>', 'Open' },
        p = { '<cmd>Telescope oldfiles<cr>', 'Recent' },
      },
      -- }}} Project

      -- }}} Bindings

      -- warning: This is a warning
      -- perf: Fully Optimized
      -- hack: This is a hacky hack-job
      -- fixme: This needs a fixin

      -- note: Some note about this line

      -- {{{ Rust
      r = { -- todo: make this language dependent binding
        name = 'Rust',
        m = { ':RustRunnables<CR>', 'Runnables' },
      },
      -- }}} Rust
    }, { prefix = '<localleader>' })
  end,
}
