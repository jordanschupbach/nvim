
return {
  'rebelot/heirline.nvim',
  -- You can optionally lazy-load heirline on UiEnter
  -- to make sure all required plugins and colorschemes are loaded before setup
  -- event = "UiEnter",
  config = function()
    local conditions = require 'heirline.conditions'
    local utils = require 'heirline.utils'

    local colors = {
      bright_bg = utils.get_highlight('Folded').bg,
      bright_fg = utils.get_highlight('Folded').fg,
      red = utils.get_highlight('DiagnosticError').fg,
      dark_red = utils.get_highlight('DiffDelete').bg,
      green = utils.get_highlight('String').fg,
      blue = utils.get_highlight('Function').fg,
      gray = utils.get_highlight('NonText').fg,
      orange = utils.get_highlight('Constant').fg,
      purple = utils.get_highlight('Statement').fg,
      cyan = utils.get_highlight('Special').fg,
      diag_warn = utils.get_highlight('DiagnosticWarn').fg,
      diag_error = utils.get_highlight('DiagnosticError').fg,
      diag_hint = utils.get_highlight('DiagnosticHint').fg,
      diag_info = utils.get_highlight('DiagnosticInfo').fg,
      git_del = utils.get_highlight('diffDeleted').fg,
      git_add = utils.get_highlight('diffAdded').fg,
      git_change = utils.get_highlight('diffChanged').fg,
    }

    local function setup_colors()
      return {
        bright_bg = utils.get_highlight("Folded").bg,
        bright_fg = utils.get_highlight("Folded").fg,
        red = utils.get_highlight("DiagnosticError").fg,
        dark_red = utils.get_highlight("DiffDelete").bg,
        green = utils.get_highlight("String").fg,
        blue = utils.get_highlight("Function").fg,
        gray = utils.get_highlight("NonText").fg,
        orange = utils.get_highlight("Constant").fg,
        purple = utils.get_highlight("Statement").fg,
        cyan = utils.get_highlight("Special").fg,
        diag_warn = utils.get_highlight("DiagnosticWarn").fg,
        diag_error = utils.get_highlight("DiagnosticError").fg,
        diag_hint = utils.get_highlight("DiagnosticHint").fg,
        diag_info = utils.get_highlight("DiagnosticInfo").fg,
        git_del = utils.get_highlight("diffDeleted").fg,
        git_add = utils.get_highlight("diffAdded").fg,
        git_change = utils.get_highlight("diffChanged").fg,
      }
    end

    vim.api.nvim_create_augroup("Heirline", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        utils.on_colorscheme(setup_colors)
      end,
      group = "Heirline",
    })

    -- Vi Mode {{{
    local ViMode = {
      -- get vim current mode, this information will be required by the provider
      -- and the highlight functions, so we compute it only once per component
      -- evaluation and store it as a component attribute
      init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
      end,
      -- Now we define some dictionaries to map the output of mode() to the
      -- corresponding string and color. We can put these into `static` to compute
      -- them at initialisation time.
      static = {
        mode_names = { -- change the strings if you like it vvvvverbose!
          n = 'N',
          no = 'N?',
          nov = 'N?',
          noV = 'N?',
          ['no\22'] = 'N?',
          niI = 'Ni',
          niR = 'Nr',
          niV = 'Nv',
          nt = 'Nt',
          v = 'V',
          vs = 'Vs',
          V = 'V_',
          Vs = 'Vs',
          ['\22'] = '^V',
          ['\22s'] = '^V',
          s = 'S',
          S = 'S_',
          ['\19'] = '^S',
          i = 'I',
          ic = 'Ic',
          ix = 'Ix',
          R = 'R',
          Rc = 'Rc',
          Rx = 'Rx',
          Rv = 'Rv',
          Rvc = 'Rv',
          Rvx = 'Rv',
          c = 'C',
          cv = 'Ex',
          r = '...',
          rm = 'M',
          ['r?'] = '?',
          ['!'] = '!',
          t = 'T',
        },
        mode_colors = {
          n = 'red',
          i = 'green',
          v = 'cyan',
          V = 'cyan',
          ['\22'] = 'cyan',
          c = 'orange',
          s = 'purple',
          S = 'purple',
          ['\19'] = 'purple',
          R = 'orange',
          r = 'orange',
          ['!'] = 'red',
          t = 'red',
        },
      },
      -- We can now access the value of mode() that, by now, would have been
      -- computed by `init()` and use it to index our strings dictionary.
      -- note how `static` fields become just regular attributes once the
      -- component is instantiated.
      -- To be extra meticulous, we can also add some vim statusline syntax to
      -- control the padding and make sure our string is always at least 2
      -- characters long. Plus a nice Icon.
      provider = function(self)
        return ' %2(' .. self.mode_names[self.mode] .. '%)'
      end,
      -- Same goes for the highlight. Now the foreground will change according to the current mode.
      hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = self.mode_colors[mode], bold = true }
      end,
      -- Re-evaluate the component only on ModeChanged event!
      -- Also allows the statusline to be re-evaluated when entering operator-pending mode
      update = {
        'ModeChanged',
        pattern = '*:*',
        callback = vim.schedule_wrap(function()
          vim.cmd 'redrawstatus'
        end),
      },
    }

    -- Vi Mode }}}

    -- {{{ FileNameBlock
    local FileNameBlock = {
      -- let's first set up some attributes needed by this component and it's children
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
    }
    -- We can now define some children separately and add them later

    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
            require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self)
        return self.icon and (self.icon .. ' ')
      end,
      hl = function(self)
        return { fg = self.icon_color }
      end,
    }

    local FileName = {
      provider = function(self)
        -- first, trim the pattern relative to the current directory. For other
        -- options, see :h filename-modifers
        local filename = vim.fn.fnamemodify(self.filename, ':.')
        if filename == '' then
          return '[No Name]'
        end
        -- now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials
        -- See Flexible Components section below for dynamic truncation
        if not conditions.width_percent_below(#filename, 0.25) then
          filename = vim.fn.pathshorten(filename)
        end
        return filename
      end,
      hl = { fg = utils.get_highlight('Directory').fg },
    }

    local FileFlags = {
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = '[+]',
        hl = { fg = 'green' },
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = '',
        hl = { fg = 'orange' },
      },
    }

    -- Now, let's say that we want the filename color to change if the buffer is
    -- modified. Of course, we could do that directly using the FileName.hl field,
    -- but we'll see how easy it is to alter existing components using a "modifier"
    -- component

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          -- use `force` because we need to override the child's hl foreground
          return { fg = 'cyan', bold = true, force = true }
        end
      end,
    }

    -- let's add the children to our FileNameBlock component
    FileNameBlock = utils.insert(
      FileNameBlock,
      FileIcon,
      utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
      FileFlags,
      { provider = '%<' }                      -- this means that the statusline is cut here when there's not enough space
    )

    -- }}} FileNameBlock

    -- {{{ LspActive

    local LSPActive = {
      condition = conditions.lsp_attached,
      update = { 'LspAttach', 'LspDetach' },

      -- You can keep it simple,
      -- provider = " [LSP]",

      -- Or complicate things a bit and get the servers names
      provider = function()
        local names = {}
        for i, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
          table.insert(names, server.name)
        end
        return ' [' .. table.concat(names, ' ') .. ']'
      end,
      hl = { fg = 'green', bold = true },
    }

    -- }}} LspActive

    -- {{{ LSPMessages
    -- I personally use it only to display progress messages!
    -- See lsp-status/README.md for configuration options.

    -- Note: check "j-hui/fidget.nvim" for a nice statusline-free alternative.
    -- local LSPMessages = {
    --   provider = require("lsp-status").status,
    --   hl = { fg = "gray" },
    -- }
    -- }}} LSPMessages

    -- {{{ Diagnostics

    local Diagnostics = {

      condition = conditions.has_diagnostics,
      static = {
        error_icon = '', -- vim.fn.sign_getdefined('DiagnosticSignError')[1].text,
        warn_icon = '', -- vim.fn.sign_getdefined('DiagnosticSignWarn')[1].text,
        info_icon = '', -- vim.fn.sign_getdefined('DiagnosticSignInfo')[1].text,
        hint_icon = '', -- vim.fn.sign_getdefined('DiagnosticSignHint')[1].text,
      },

      init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,

      update = { 'DiagnosticChanged', 'BufEnter' },

      {
        provider = '![',
      },
      {
        provider = function(self)
          -- 0 is just another output, we can decide to print it or not!
          return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
        end,
        hl = { fg = 'diag_error' },
      },
      {
        provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
        end,
        hl = { fg = 'diag_warn' },
      },
      {
        provider = function(self)
          return self.info > 0 and (self.info_icon .. self.info .. ' ')
        end,
        hl = { fg = 'diag_info' },
      },
      {
        provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = 'diag_hint' },
      },
      {
        provider = ']',
      },
    }

    -- }}} Diagnostics

    -- {{{ Git
    local Git = {
      condition = conditions.is_git_repo,

      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,
      hl = { fg = 'orange' },


      { -- git branch name
        provider = function(self)
          return ' ' .. self.status_dict.head
        end,
        hl = { bold = true },
      },
      -- You could handle delimiters, icons and counts similar to Diagnostics
      {
        condition = function(self)
          return self.has_changes
        end,
        provider = '(',
      },
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and ('+' .. count)
        end,
        hl = { fg = '#00dd00' },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ('-' .. count)
        end,
        hl = { fg = '#cc0000' },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ('~' .. count)
        end,
        hl = { fg = '#cccc00' },
      },
      {
        condition = function(self)
          return self.has_changes
        end,
        provider = ')',
      },
    }
    -- }}} Git


    -- {{{ Tabpage
    local Tabpage = {
      provider = function(self)
        return "%" .. self.tabnr .. "T " .. self.tabpage .. " %T"
      end,
      hl = function(self)
        if not self.is_active then
          return "TabLine"
        else
          return "TabLineSel"
        end
      end,
    }

    local TabpageClose = {
      provider = "%999X  %X",
      hl = "TabLine",
    }

    local TabPages = {
      -- only show this component if there's 2 or more tabpages
      condition = function()
        return #vim.api.nvim_list_tabpages() >= 2
      end,
      { provider = "%=" },
      utils.make_tablist(Tabpage),
      TabpageClose,
    }


    -- }}} Tabpage




    -- {{{ Tabline offset
    local TabLineOffset = {
      condition = function(self)
        local win = vim.api.nvim_tabpage_list_wins(0)[1]
        local bufnr = vim.api.nvim_win_get_buf(win)
        self.winid = win

        if vim.bo[bufnr].filetype == "NvimTree" then
          self.title = "NvimTree"
          return true
          -- elseif vim.bo[bufnr].filetype == "TagBar" then
          --     ...
        end
      end,

      provider = function(self)
        local title = self.title
        local width = vim.api.nvim_win_get_width(self.winid)
        local pad = math.ceil((width - #title) / 2)
        return string.rep(" ", pad) .. title .. string.rep(" ", pad)
      end,

      hl = function(self)
        if vim.api.nvim_get_current_win() == self.winid then
          return "TablineSel"
        else
          return "Tabline"
        end
      end,
    }

    -- }}} Tabline offset

local Align = { provider = "%=" }
local Space = { provider = " " }

    local StatusLine = {
      { ViMode },
      { Space },
      { FileNameBlock },
      { Align },
      { LSPActive },
      { Diagnostics },
      { Git },
      -- { LSPMessages },
    }

    local WinBar = { {}, { {}, {} } }
    local TabLine = { {}, {}, {} }

    require('heirline').setup {
      statusline = StatusLine,
      winbar = WinBar,
      tabline = TabLine,
      opts = {
        colors = colors,
      },
    }
  end,
}
