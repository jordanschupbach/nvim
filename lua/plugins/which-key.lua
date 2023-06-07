return {
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup {
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

    local wk = require 'which-key'
    -- As an example, we will create the following mappings:
    --  * <leader>ff find files
    --  * <leader>fr show recent files
    --  * <leader>fb Foobar
    -- we'll document:
    --  * <leader>fn new file
    --  * <leader>fe edit file
    -- and hide <leader>1

    wk.register({

      a = {
        name = 'AnyJump', -- group name
        a = { '<cmd>AnyJump<cr>', 'AnyJump' },
        b = { '<cmd>AnyJumpBack<cr>', 'Back' },
        l = { '<cmd>AnyJumpLastResult<cr>', 'Last Result' },
      },

      b = {
        name = 'Buffers',
        b = { '<cmd>Telescope buffers theme=ivy<cr>', 'Buffers' },
        -- l = { '<cmd>require("bufdelete").bufdelete(0)<cr>', 'Delete' },
      },

      c = {
        name = 'Comment',
        c = { '<cmd>CommentToggle<cr>', 'Toggle' },
        -- l = { '<cmd>require("bufdelete").bufdelete(0)<cr>', 'Delete' },
      },

      d = {
        name = 'Debug',
        b = { ":lua require'dap'.toggle_breakpoint()<CR>", 'Toggle Breakpoint' },
        B = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", 'Breakpoint w/ Condition' },
        c = { ":lua require'dap'.continue()<CR>", 'Continue' },
        d = { ":lua require'dap'.continue()<CR>", 'Open' },
        l = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log opint message: '))<CR>", 'Log' },
        o = { ":lua require'dap'.step_over()<CR>", 'Step Over' },
        O = { ":lua require'dap'.step_out()<CR>", 'Step Out' },
        i = { ":lua require'dap'.into()<CR>", 'Step Into' },
        s = { ":lua require'dap'.repl.open()<CR>", 'Shell' },
        -- t = { ":lua require'dap-go'.debug_test()<CR>", 'Test' },
        m = { ":lua require'jdtls.dap'.setup_dap_main_class_configs()<CR>", 'Main' },

      },

      e = {
        name = 'Errors',
        b = { ":Trouble document_diagnostics<CR>", 'Buffer' },
        e = { ":TroubleToggle<CR>", 'Error List' },
        f = { ":CodeActionMenu<CR>", 'Fix' },
        g = { ":lua require('trouble').first({skip_groups = true, jump = true})<CR>", 'First' },
        G = { ":lua require('trouble').last({skip_groups = true, jump = true})<CR>", 'Last' },
        j = { ":lua require('trouble').next({skip_groups = true, jump = true})<CR>", 'Next' },
        k = { ":lua require('trouble').next({skip_groups = true, jump = true})<CR>", 'Previous' },
        p = { ":Trouble workspace_diagnostics<CR>", 'Project' },
      },


      f = {
        name = 'Files',
        -- f = { "<cmd>NvimTreeToggle<cr>", 'File Tree' },
        f = { "<cmd>NeoTreeShowToggle<cr>", 'File Tree' },
      },


      g = {
        name = 'Git', -- group name
        a = { ':require("diaglist").open_all_diagnostics()', 'All' },
        b = { '<cmd>Telescope git_branches theme=ivy<cr>', 'Branches' },
        c = { '<cmd>Telescope git_commits theme=ivy<cr>', 'Commits' },
        f = { '<cmd>Telescope git_files theme=ivy<cr>', 'Files' },
        g = { '<cmd>Neogit kind=vsplit<cr>', 'NeoGit' },
        j = { 'Gitsigns prev_hunk<cr>', 'Next Hunk' },
        k = { 'Gitsigns prev_hunk<cr>', 'Previous Hunk' },
        s = { 'Gitsigns stage_hunk<cr>', 'Stage Hunk' },
        u = { 'Gitsigns undo_stage_hunk<cr>', 'Undo Stage Hunk' },
      },

      h = {
        name = 'Help', -- group name
        k = { ':Telescope keymaps theme=ivy<cr>', 'Keys' },
      },

      j = {
        name = 'Jump', -- group name
        a = { ':AnyJump<CR>', 'AnyJump' },
        b = { ':AnyJumpBack<CR>', 'AnyJumpBack' },
        j = { ':HopChar2<CR>', 'Jump (HopChar2)' },
        l = { ':AnyJumpLastResult<CR>', 'AnyJumpLastResult' },
        d = { ':Telescope lsp_definitions<CR>', 'Definition' },
      },

      l = {
        name = 'Jump', -- group name
        l = { ':AerialToggle<CR>', 'Sidebar' },
      },


      m = {
        name = 'Marks', -- group name
        m = { ':MyJumpMarks<CR>', 'Marks' },
      },
      -- TODO: Some other TODO
      p = {
        name = 'project', -- group name
        b = { '<cmd>BuildMe<cr>', 'Build' },
        f = { '<cmd>Telescope fd theme=ivy<cr>', 'Files' },
        r = { '<cmd>Telescope live_grep theme=ivy<cr>', 'Grep' },
        s = { '<cmd>split<CR>:terminal<cr>', 'Shell' },
        o = { '<cmd>Telescope project theme=ivy<cr>', 'Open' },
        p = { '<cmd>Telescope oldfiles<cr>', 'Recent' },
      },


      -- WARNING: This is a warning
      -- PERF: Fully Optimized
      -- HACK: This is a hacky hack-job
      -- FIX: This needs a fixin
      -- NOTE: Some note about this line
      r = { -- TODO: make this language dependent binding
        name = 'Rust',
        m = { ':RustRunnables<CR>', 'Runnables' },
      },


    }, { prefix = '<localleader>' })
  end,
}
