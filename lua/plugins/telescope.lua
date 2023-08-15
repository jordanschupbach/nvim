-- https://github.com/nvim-telescope/telescope.nvim

return {
  'nvim-telescope/telescope.nvim',
  -- {{{ dependencies
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-telescope/telescope-hop.nvim',
    -- 'nvim-telescope/telescope-ui-select.nvim',
    'L3MON4D3/LuaSnip',
    'kelly-lin/telescope-ag',
    'benfowler/telescope-luasnip.nvim',
    'nvim-lua/plenary.nvim',
    'smartpde/telescope-recent-files',
    'tyru/open-browser.vim',
    'fhill2/telescope-ultisnips.nvim',
    'AckslD/nvim-neoclip.lua',
    'xiyaowong/telescope-emoji.nvim',
    'folke/flash.nvim',
  },
  -- }}} dependencies

  -- {{{ config
  config = function()
    require('telescope').setup {
      prompt_prefix = ' ',
      selection_caret = '* ',
      path_display = { 'smart' },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--no-ignore', -- **This is the added flag**
        '--hidden', -- **Also this flag. The combination of the two is the same as `-uu`**
      },
      extensions = {
        -- ["ui-select"] = {
        --   require("telescope.themes").get_dropdown {
        --     -- even more opts
        --   },
        -- },

        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },

        -- https://github.com/xiyaowong/telescope-emoji.nvim
        emoji = {
          action = function(emoji)
            -- argument emoji is a table.
            -- {name="", value="", cagegory="", description=""}
            vim.fn.setreg('*', emoji.value)
            print([[Press p or "*p to paste this emoji]] .. emoji.value)
            -- insert emoji when picked
            vim.api.nvim_put({ emoji.value }, 'c', false, true)
          end,
        },

        hop = {
          -- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
          keys = {
            'a',
            's',
            'd',
            'f',
            'g',
            'h',
            'j',
            'k',
            'l',
            ';',
            'q',
            'w',
            'e',
            'r',
            't',
            'y',
            'u',
            'i',
            'o',
            'p',
            'A',
            'S',
            'D',
            'F',
            'G',
            'H',
            'J',
            'K',
            'L',
            ':',
            'Q',
            'W',
            'E',
            'R',
            'T',
            'Y',
            'U',
            'I',
            'O',
            'P',
          },
          -- Highlight groups to link to signs and lines; the below configuration refers to demo
          -- sign_hl typically only defines foreground to possibly be combined with line_hl
          sign_hl = { 'WarningMsg', 'Title' },
          -- optional, typically a table of two highlight groups that are alternated between
          line_hl = { 'CursorLine', 'Normal' },
          -- options specific to `hop_loop`
          -- true temporarily disables Telescope selection highlighting
          clear_selection_hl = false,
          -- highlight hopped to entry with telescope selection highlight
          -- note: mutually exclusive with `clear_selection_hl`
          trace_entry = true,
          -- jump to entry where hoop loop was started from
          reset_selection = true,
        },
      },
    }
    require('telescope').setup {}
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension 'luasnip')
    pcall(require('telescope').load_extension 'neoclip')
    -- pcall(require('telescope').load_extension 'session-lens')

    pcall(require('telescope').load_extension 'emoji')
    -- pcall(require("telescope").load_extension("ui-select"))
    pcall(require('telescope').load_extension 'file_browser')
    pcall(require('telescope').load_extension, 'project')
    pcall(require('telescope').load_extension, 'ag')
    pcall(require('telescope').load_extension, 'recent_files')
    pcall(require('telescope').load_extension, 'ultisnips')
    pcall(require('telescope').load_extension, 'symbols')
    -- require'telescope.builtin'.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji'} }

    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    -- vim.keymap.set('n', '<leader>/', function()
    --   -- You can pass additional configuration to telescope to change theme, layout, etc.
    --   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --     winblend = 10,
    --     previewer = false,
    --   })
    -- end, { desc = '[/] Fuzzily search in current buffer]' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
  end,

  -- }}} config
}

-- {{{ old config (needs processing)
-- -- https://github.com/nvim-telescope/telescope.nvim
-- OK_TELESCOPE, TELESCOPE = pcall(require, "telescope")
-- if not OK_TELESCOPE then
--     print('"nvim-telescope/telescope.nvim" not available')
--     return
-- end
--
-- local open_with_trouble = nil
-- local ok_trouble, trouble = pcall(require, "trouble")
-- if ok_trouble then
--     open_with_trouble = trouble.open_with_trouble
-- else
--     print(
--         '"folke/trouble.nvim" not available, for use in "nvim-telescope/nvim-telescope"'
--     )
-- end
--
-- TELESCOPE_BUILTIN = require("telescope.builtin")
-- local telescope_extensions = TELESCOPE.extensions
--
-- TELESCOPE.setup({
--     defaults = {
--
--         prompt_prefix = " ",
--         selection_caret = "📌 ",
--         path_display = { "smart" },
--
--         mappings = {
--             i = { ["<C-t>"] = open_with_trouble },
--             n = { ["<C-t>"] = open_with_trouble },
--         },
--     },
--     extensions = {
--         fzf = {
--             fuzzy = true, -- false will only do exact matching
--             override_generic_sorter = true, -- override the generic sorter
--             override_file_sorter = true, -- override the file sorter
--             case_mode = "smart_case", -- or "ignore_case" or "respect_case"
--             -- the default case_mode is "smart_case"
--         },
--     },
-- })
--
-- -- Extensions
-- TELESCOPE.load_extension("fzf")
-- TELESCOPE.load_extension("luasnip")
-- TELESCOPE.load_extension("file_browser")
-- TELESCOPE.load_extension("packer")
-- TELESCOPE.load_extension("project")
--
-- local project_files = function()
--     local ok_git_files =
--         pcall(TELESCOPE_BUILTIN.git_files, { show_untracked = true })
--     if not ok_git_files then
--         TELESCOPE_BUILTIN.find_files({})
--     end
-- end
--
-- -- Builtins
-- vim.keymap.set({ "n" }, "<leader>ff", function()
--     TELESCOPE_BUILTIN.find_files()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>fp", function()
--     project_files()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>fg", function()
--     TELESCOPE_BUILTIN.live_grep()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>ls", function()
--     TELESCOPE_BUILTIN.buffers()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>ft", function()
--     TELESCOPE_BUILTIN.builtin()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<C-_>", function()
--     TELESCOPE_BUILTIN.current_buffer_fuzzy_find({
--         previewer = false,
--         skip_empty_lines = true,
--     })
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>ht", function()
--     TELESCOPE_BUILTIN.help_tags()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>ch", function()
--     TELESCOPE_BUILTIN.command_history()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>sh", function()
--     TELESCOPE_BUILTIN.search_history()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>fo", function()
--     TELESCOPE_BUILTIN.oldfiles()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>fb", function()
--     telescope_extensions.file_browser.file_browser()
-- end, NOREMAP_SILENT)
--
-- -- `find_files` and `file_browser` for custom locations which I need to visit
-- -- often
-- -- `fz` - Find fuzzy
-- --      - This is different from `ff` to avoid the `timeoutlen` delay
-- -- `fe` - File explorer
-- --      - This is different from `fb` to avoid the `timeoutlen` delay
--
-- -- Neovim
-- vim.keymap.set({ "n" }, "<leader>fzv", function()
--     TELESCOPE_BUILTIN.find_files({
--         cwd = "~/.config/nvim/",
--     })
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>fev", function()
--     telescope_extensions.file_browser.file_browser({
--         path = "~/.config/nvim/",
--         cwd_to_path = true,
--     })
-- end, NOREMAP_SILENT)
--
-- -- Chezmoi
-- vim.keymap.set({ "n" }, "<leader>fzc", function()
--     TELESCOPE_BUILTIN.find_files({
--         cwd = "~/.local/share/chezmoi/",
--     })
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>fec", function()
--     telescope_extensions.file_browser.file_browser({
--         path = "~/.local/share/chezmoi/",
--         cwd_to_path = true,
--     })
-- end, NOREMAP_SILENT)
--
-- -- Journal
-- vim.keymap.set({ "n" }, "<leader>fzj", function()
--     TELESCOPE_BUILTIN.find_files({
--         cwd = "~/code/notes/journal/journal/",
--     })
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>fej", function()
--     telescope_extensions.file_browser.file_browser({
--         path = "~/code/notes/journal/journal/",
--         cwd_to_path = true,
--     })
-- end, NOREMAP_SILENT)
--
-- -- Chezmoi
-- vim.keymap.set({ "n" }, "<leader>fzn", function()
--     TELESCOPE_BUILTIN.find_files({
--         cwd = "~/code/notes/notebook/notebook",
--     })
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>fen", function()
--     telescope_extensions.file_browser.file_browser({
--         path = "~/code/notes/notebook/notebook/",
--         cwd_to_path = true,
--     })
-- end, NOREMAP_SILENT)
--
-- -- Extensions
-- vim.keymap.set({ "n" }, "<leader>fq", function()
--     telescope_extensions.frecency.frecency()
-- end, NOREMAP_SILENT)
-- vim.keymap.set({ "n" }, "<leader>fs", function()
--     telescope_extensions.luasnip.luasnip()
-- end, NOREMAP_SILENT)
--
-- VIM_KEYMAP_SET(
--     { "n" },
--     "<localleader>po",
--     ":Telescope projects<CR>",
--     NOREMAP_SILENT
-- )

-- -- [[ Configure Telescope ]]
-- -- See `:help telescope` and `:help telescope.setup()`
-- require('telescope').setup {
--   defaults = {
--     mappings = {
--       i = {
--         ['<C-u>'] = false,
--         ['<C-d>'] = false,
--       },
--     },
--   },
-- }
--
-- -- Enable telescope fzf native, if installed
-- pcall(require('telescope').load_extension, 'fzf')
--
-- -- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer]' })
-- }}} old config (needs processing)
