return {

  'ap/vim-css-color',
  'dylanaraps/wal.vim',
  'lvimuser/lsp-inlayhints.nvim',
  'f-person/git-blame.nvim',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'L3MON4D3/LuaSnip',
  'mfussenegger/nvim-jdtls',
  'mfussenegger/nvim-dap',
  'mtikekar/nvim-send-to-term',
  'nvim-lua/plenary.nvim',
  'nvim-neotest/neotest-python',
  'nvim-neotest/neotest-plenary',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'onsails/diaglist.nvim',
  'onsails/lspkind-nvim',
  'p00f/clangd_extensions.nvim',
  'rouge8/neotest-rust',
  'shunsambongi/neotest-testthat',
  'ray-x/cmp-treesitter',
  'RRethy/nvim-treesitter-textsubjects',
  'RRethy/nvim-base16',
  'saadparwaiz1/cmp_luasnip',
  'SirVer/ultisnips',
  {'sidebar-nvim/sidebar.nvim',
    config = function()
      local sidebar = require("sidebar-nvim")
      local opts = {open = true,
                    side = "right",
                    sections = { "datetime", "git", "diagnostics" , "todos", "symbols"},

                    todos = {
                        icon = "",
                        ignored_paths = {'~'}, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
                        initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
                    },
    symbols = {
        icon = "ƒ",
    },

      }
      sidebar.setup(opts)
    end
  },
  'stevearc/dressing.nvim',
  'chrisbra/Colorizer',
  {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },

  -- 'rebelot/kanagawa.nvim',
-- {'rebelot/kanagawa.nvim',
--   config = function()
-- -- Default options:
-- require('kanagawa').setup({
--     undercurl = true,            -- enable undercurls
--     commentStyle = { italic = true },
--     functionStyle = {},
--     keywordStyle = { italic = true},
--     statementStyle = { bold = true },
--     typeStyle = {},
--     transparent = true,         -- do not set background color
--     dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--     colors = {                   -- add/modify theme and palette colors
--         palette = {}
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--     },
--     overrides = function(colors) -- add/modify highlights
--         return {}
--     end,
--     theme = "wave"               -- Load "wave" theme when 'background' option is not set
--     background = {               -- map the value of 'background' option to a theme
--         dark = "wave",           -- try "dragon" !
--         light = "lotus"
--     },
-- })
--
-- vim.cmd("colorscheme kanagawa")
--   end }


}
