-- local hover = require(".my.lsp.hover")

local o = require 'options'
local m = require('mapx').setup { global = true, whichkey = true }
local ju = require 'jutils'

-- local ngit = require"neogit"

-- m.nmap('<C-G>', '<cmd>ChatGPT<cr>', 'ChatGPT')

m.nmap('<C-f>', '<cmd>FormatWriteLock<cr>', 'Format')
m.nmap('I', '<cmd>Lspsaga show_line_diagnostics<cr>', 'Line diagnostics')
m.nmap('<C-1>', '<cmd>NvimTreeToggle<cr>', 'Toggle Nvim Tree')
m.nmap('<C-2>', "<cmd>lua require'jutils'.toggle_neogit()<cr>", 'NeoGit')

-- {{{ Tab mappings
m.nmap('<A-n>', ':tabnext<CR>', 'Next Tab')
m.nmap('<A-p>', ':tabprevious<CR>', 'Previous Tab')
m.nmap('<A-c>', ':tabnew)<CR>', 'Create Tab')
-- }}} Tab mappings

-- {{{ File mappings

m.nmap('<leader>ff', '<cmd>NvimTreeToggle<cr>', 'File Tree')
m.nmap('<leader>fo', '<cmd>Other<cr>', 'Other File')
m.nmap('<leader>fr', '<cmd>Telescope oldfiles<cr>', 'Recent Files')

-- }}} File mappings

m.nmap('<leader>ss', "<cmd>lua require'jutils'.move_current_tab_to_next_position()<cr>", 'move tab next')

-- m.nmap('<leader>ss', '<cmd>SidebarNvimToggle<cr>', 'Sidebar')

m.nmap('<leader>vc', "<cmd>lua require'jdtls'.test_class()<cr>", 'Test class (DAP)')
m.nmap('<leader>vm', "<cmd>lua require'jdtls'.test_nearest_method()<cr>", 'Test method (DAP)')

m.nmap('<C-b>', '<cmd>Other<cr>', 'Jump to other file')
-- nnoremap("<leader>vc", jdtls.test_class, bufopts, "Test class (DAP)")
-- nnoremap("<leader>vm", jdtls.test_nearest_method, bufopts, "Test method (DAP)")

-- {{{ mymap fun
--- Adds a new normal binding map.
--- Examples:
--- <pre>lua
---   vim.keymap.set('n', 'lhs', function() print("real lua function") end)
--- </pre>
---
---@param mode string|table     Mode short-name, see |nvim_set_keymap()|.
---                          Can also be list of modes to create mapping on multiple modes.
---@param key string           Left-hand side |{lhs}| of the mapping.
---@param value string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---
local function mymap(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end
-- }}} mymap fun

-- vim.keymap.set({ 'n' }, '<S-k>', function()
--   require('lsp_signature').toggle_float_win()
-- end, { silent = true, noremap = true, desc = 'toggle signature' })

-- {{{ Commented but maybe useful
-- vim.keymap.set({ 'n', 'i' }, '<C-k>', function()
--   require('lsp_signature').toggle_float_win()
-- end, { silent = true, noremap = true, desc = 'toggle signature' })
--
-- vim.keymap.set({ 'n' }, '<Leader>k', function()
--  vim.lsp.buf.signature_help()
-- end, { silent = true, noremap = true, desc = 'toggle signature' })
--
--
--
-- Errors b/c vim.diagnostics doesn't exist?
-- mymap('n', '[d', ':lua vim.diagnostics.goto_prev()<CR>')
-- mymap('n', ']d', ':lua vim.diagnostics.goto_next()<CR>')
-- mymap('n', '<leader>e', ':lua vim.diagnostics.open_float()<CR>')
-- mymap('n', '<leader>q', ':lua vim.diagnostics.setloclist()<CR>')
--
--
-- place this in one of your configuration file(s)
-- local hop = require('hop')
-- local directions = require('hop.hint').HintDirection
-- mymap('n', 'f', ":lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }<cr>")
-- mymap('n', 'F', ':lua require(\'hop\').hint_char1({ direction = require(\'hop.hint\').HintDirection.BEFORE_CURSOR, current_line_only = true }<cr>')
-- mymap('n', 't', ':lua require(\'hop\').hint_char1({ direction = require(\'hop.hint\').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }<cr>')
-- mymap('n', 'T', ':lua require(\'hop\').hint_char1({ direction = require(\'hop.hint\').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>')
--
-- }}} Commented but maybe useful

-- {{{ Inbox
-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
mymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
mymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')

-- Diagnostic jump with filters such as only jumping to an error
mymap('n', '[E', function()
  require('lspsaga.diagnostic'):goto_prev { severity = vim.diagnostic.severity.ERROR }
end)
mymap('n', ']E', function()
  require('lspsaga.diagnostic'):goto_next { severity = vim.diagnostic.severity.ERROR }
end)

-- Call hierarchy
mymap('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
mymap('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')

-- Floating terminal
mymap({ 'n', 't' }, '<A-d>', '<cmd>Lspsaga term_toggle<CR>')

mymap('n', '<C-a>', ':ChatGPTCompleteCode<CR>')

m.nmap('<leader>th', ':LspUI inlay_hint<CR>')
-- mymap('i', '<C-k>', ':lua vim.lsp.buf.signature_help<CR>')
-- }}} Inbox

-- {{{ Simple convenience
m.nmap('vv', 'V', 'visual line')
m.nmap('<C-TAB>', ':tabnext', 'Next tab')
-- }}} Simple convenience

-- {{{ Anyjump
m.nname('<leader>a', 'AnyJump')
m.nmap('<leader>aa', ':AerialToggle<CR>', 'Toggle Outline')
m.nmap('<leader>ab', ':AnyJumpBack<CR>', 'Toggle Outline')
m.nmap('<leader>al', ':AnyJumpLastResult<CR>', 'Toggle Outline')
-- }}} Anyjump

-- {{{ Buffers
m.nname('<leader>b', 'Buffers')
m.nmap('<leader>bb', ':Telescope buffers theme=ivy<CR>', 'Buffers')
-- }}} Buffers

-- {{{ Comment
m.nname('<leader>c', 'Comment')
m.nmap('<leader>cc', ':CommentToggle<CR>', 'Comment') -- NOTE: Maybe sync w/ gc?
-- }}} Comment

-- {{{ Code action mappings
m.vmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', 'Code Action')
m.nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', 'Code Action')
-- }}} Code action mappings

-- {{{ Errors

-- m.nmap("<A-n>", ":lua require('trouble').next({skip_groups = true, jump = true})<CR>", 'Next Error')
-- m.nmap('<A-p>', ":lua require('trouble').previous({skip_groups = true, jump = true})<CR>", "Previous Error")

m.nname('<leader>e', 'Errors')
m.nmap('<leader>eb', ':Trouble document_diagnostics<CR>', 'Buffer')
m.nmap('<leader>ee', ':TroubleToggle<CR>', 'Errors List')
-- m.nmap('<leader>ef', ':CodeActionMenu<CR>', 'Errors List')
m.nmap('<leader>eg', ":lua require('trouble').first({skip_groups = true, jump = true})<CR>", 'First')
m.nmap('<leader>eG', ":lua require('trouble').last({skip_groups = true, jump = true})<CR>", 'Last')
m.nmap('<leader>ej', ":lua require('trouble').next({skip_groups = true, jump = true})<CR>", 'Next')
m.nmap('<leader>ek', ":lua require('trouble').previous({skip_groups = true, jump = true})<CR>", 'Previous')
m.nmap('<leader>ep', ':Trouble workspace_diagnostics<CR>', 'Project')
-- }}} Errors

-- {{{ Git
m.nname('<leader>g', 'Git')
m.nmap('<leader>ga', ':require("diaglist").open_all_diagnostics()', 'All')
m.nmap('<leader>gb', '<cmd>Telescope git_branches theme=ivy<cr>', 'Branches')
m.nmap('<leader>gc', '<cmd>Telescope git_commits theme=ivy<cr>', 'Commits')
m.nmap('<leader>gf', '<cmd>Telescope git_files theme=ivy<cr>', 'Files')
m.nmap('<leader>gg', '<cmd>Neogit kind=vsplit<cr>', 'NeoGit')
m.nmap('<leader>gj', ':Gitsigns prev_hunk<cr>', 'Next Hunk')
m.nmap('<leader>gk', ':Gitsigns prev_hunk<cr>', 'Previous Hunk')
m.nmap('<leader>gs', ':Gitsigns stage_hunk<cr>', 'Stage Hunk')
m.nmap('<leader>gu', ':Gitsigns undo_stage_hunk<cr>', 'Undo Stage Hunk')
-- }}} Git

-- {{{ Help
m.nname('<leader>h', 'Help')
m.nmap('<leader>hk', ':Telescope keymaps theme=ivy<cr>', 'Keys')
-- }}} Help

-- {{{ Jump bindings

m.nmap('<leader>jw', '<cmd>VisitLinkNearest<cr>', 'Link')

m.nmap('<leader>o', '<cmd>Portal jumplist backward<cr>', 'Portal jump back')
m.nmap('<leader>i', '<cmd>Portal jumplist forward<cr>', 'Portal jump forward')

m.nmap('<M-o>', ":lua require('bufjump').backward()<cr>", 'Bufjump back')
m.nmap('<M-i>', ":lua require('bufjump').forward()<cr>", 'Bufjump forward')
m.nmap('<leader>jl', ':Telescope jumplist<CR>', 'Jumplist')

-- vim.keymap.set("n", "<leader>o", "<cmd>Portal jumplist backward<cr>")
-- vim.keymap.set("n", "<leader>i", "<cmd>Portal jumplist forward<cr>")

-- }}} Jump bindings

-- {{{ Go(To) mappings
m.nname('g', 'Go(To)')
m.nmap('gp', '<cmd>Lspsaga peek_definition<CR>', 'LSP: [g]o [p]eek')
m.nmap('gd', '<cmd>Lspsaga goto_definition<CR>', 'LSP: [g]oto [d]efinition')
m.nmap('gD', '<cmd>Lspsaga goto_type_definition<CR>', 'LSP: [g]oto [d]efinition')
m.nmap('gf', '<cmd>Lspsaga lsp_finder<CR>', 'LSP: [g]o [f]ind')
m.nmap('gp', '<cmd>Lspsaga peek_type_definition<CR>', 'LSP: [g]oto [t]ypedef (peek)')
m.nmap('gr', ':Telescope lsp_references theme=ivy<CR>', 'LSP: [g]oto [r]eferences')
m.nmap('gee', ':Lspsaga show_buf_diagnostics<CR>', 'LSP: [g]oto [r]eferences')
m.nmap('geb', ':Lspsaga show_buf_diagnostics<CR>', 'LSP: [g]oto [r]eferences')
m.nmap('gew', ':Lspsaga show_workspace_diagnostics<CR>', 'LSP: [g]oto [r]eferences')
m.nmap('I', ':Lspsaga show_line_diagnostics<CR>', 'LSP: [g]oto [r]eferences')
m.vmap('gs', ':Sort<CR>', '[g]o [s]ort')
-- m.nmap('gP', ':Telescope neoclip theme=ivy<CR>', 'LSP: [g]o [P]aste')
-- }}} Go(To) mappings

-- {{{ LSP mappings

-- m.nmap('K', '<cmd>Lspsaga hover_doc ++keep<CR>', 'Hover Documentation')
-- m.nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

m.nname('<leader>l', 'LSP')
m.nmap('<leader>la', ':CodeActionMenu<CR>', 'Code Actions')
m.nmap('<leader>ll', ':AerialToggle<CR>', 'Toggle Outline')
m.nmap('<leader>lr', ':Lspsaga rename<CR>', 'Refactor word in buffer')
m.nmap('<leader>lR', ':Lspsaga rename ++project<CR>', 'Refactor word in project')
m.nmap('<leader>lo', '<cmd>Lspsaga outline<CR>', 'Toggle Outline (Alternate)')
m.nmap('<leader>lf', '<cmd>Lspsaga lsp_finder<CR>', 'Find')
m.nmap('<leader>lth', ':LspUI inlay_hint<CR>')
m.nmap('<leader>ltl', ':LspLensToggle<CR>')
m.nmap('<leader>lk', ':DocsViewToggle<CR>')

m.nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
m.nmap('<leader>ca', ':CodeActionMenu<CR>', '[C]ode [A]ction')
-- m.nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', 'Code Action')
-- m.nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
-- m.nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
m.nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
m.nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
-- m.nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
m.nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
-- -- See `:help K` for why this keymap
-- -- nmap('<A-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
-- Lesser used LSP functionality
-- m.nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
m.nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
m.nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
m.nmap('<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')
-- m.nmap('K', vim.lsp.buf.hover)
--
-- m.nmap('K', require('hover').hover, 'hover docs')
-- m.nmap('gK', require('hover').hover_select, 'goto docs')

m.nmap('K', '<CMD>Lspsaga hover_doc<CR>', 'hover docs')
m.nmap('gK', '<CMD>Lspsaga goto_definition<CR>', 'hover docs')

-- vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
-- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})

m.nmap('gi', vim.lsp.buf.implementation, 'Go[to] Implementation')
m.nmap('<C-k>', vim.lsp.buf.signature_help, 'Lsp Signature')
m.nmap('<space>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add')
m.nmap('<space>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove')
m.nmap('<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, 'Workspace List')
m.nmap('<space>D', vim.lsp.buf.type_definition, 'Type Definition')
-- m.nmap('gr', vim.lsp.buf.references, 'Buffer References')
m.nmap('<space>f', vim.lsp.buf.formatting, 'Format Buffer')

-- m.nmap("<leader>lr", ":LspRestart<Cr>", "Restart LSP")
-- m.nmap("<leader>ls", ":LspStart<Cr>", "Start LSP")
-- m.nmap("<leader>lS", ":LspStop<Cr>", "Stop LSP")

-- }}} LSP mappings

-- {{{ Show mappings
m.nname('<leader>s', 'Show')
m.nmap('<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>', 'Line diagnostics')
m.nmap('<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', 'Buffer diagnostics')
m.nmap('<leader>sw', '<cmd>Lspsaga show_workspace_diagnostics<CR>', 'Workspace diagnostics')
m.nmap('<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>', 'Cursor diagnostics')
-- }}} Show mappings

-- {{{ fix to use mymap
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- }}} fix to use mymap

-- {{{ Buffer bindings
mymap('n', '<leader>bb', ':Telescope buffers theme=ivy<CR>')
-- mymap('n', '<leader>bd', ":lua require('bufdelete').bufdelete(0)<CR>")
mymap('n', '<leader>bd', ':bp<bar>sp<bar>bn<bar>bd<CR>')

-- }}} Buffer bindings

-- {{{ Error Bindings
mymap('n', '<leader>ej', ':lnext<CR>')
mymap('n', '<leader>ek', ':lprevious<CR>')

mymap('n', '<A-n>', ":lua require('trouble').next({skip_groups = true, jump = true})<CR>")
mymap('n', '<A-p>', ":lua require('trouble').previous({skip_groups = true, jump = true})<CR>")

-- mymap('n', '<leader>ej', ":lua require('trouble').next({skip_groups = true, jump = true})<CR>")
-- mymap('n', '<leader>ek', ":lua require('trouble').previous({skip_groups = true, jump = true})<CR>")
mymap('n', '<leader>egg', ":lua require('trouble').first({skip_groups = true, jump = true})<CR>")
mymap('n', '<leader>eG', "lua require('trouble').last({skip_groups = true, jump = true})<CR>")

mymap('n', '<leader>ee', ':TroubleToggle<CR>')
mymap('n', '<leader>eb', ':Trouble document_diagnostics<CR>')
mymap('n', '<leader>ep', ':Trouble workspace_diagnostics<CR>')
mymap('n', '<leader>ef', ':CodeActionMenu<CR>')

-- Use diaglist???
mymap('n', '<leader>ea', ":lua require('diaglist').open_all_diagnostics()<CR>")

-- -- nmap <space>dw <cmd>lua require('diaglist').open_all_diagnostics()<cr>
-- -- nmap <space>d0 <cmd>lua require('diaglist').open_buffer_diagnostics()<cr>

-- }}} Error Bindings

-- {{{ GoTo bindings

-- mymap('n', 'gd', ':lua require("goto-preview").goto_preview_definition()<CR>')
mymap('n', 'gm', ':MyJumpMarks<CR>')
-- mymap('n', 'gt', ':lua require("goto-preview").goto_type_definition()<CR>')
-- mymap('n', 'gt', ':lua require("goto-preview").goto_type_implementation()<CR>')
mymap('v', 's', ':SlimeSend<CR>')
mymap('v', 'S', ':SlimeSend<CR>')

-- }}} GoTo bindings

-- {{{ Slime

mymap('n', '<A-return>', ':SlimeSendCurrentLine<CR>')
mymap('v', '<A-return>', ':SlimeSend<CR>')
mymap('n', '<leader>sc', ':lua require("goto-preview").goto_preview_definition()<CR>')
mymap('n', '<leader>sc', ':lua SlimeConfig <CR>')

-- }}} Slime

-- {{{ Tabs

-- mymap('n', '<C-w>', ':BufferClose<CR>')
mymap('n', '<leader><Tab>k', ':tabonly<CR>')
mymap('n', '<leader><Tab>h', ':tabprevious<CR>')
mymap('n', '<leader><Tab>l', ':tabnext<CR>')
mymap('n', '<leader><Tab>L', ':tabmove<CR>')
-- mymap('n', '<leader><Tab>H', ':BufferMove<CR>')
mymap('n', '<leader><Tab>d', ':tabclose<CR>')
mymap('n', '<leader><Tab>c', ':tabnew<CR>')
mymap('n', '<C-Tab>', ':tabnext<CR>')
mymap('n', '<A-S-Tab>', ':tabprevious<CR>')
mymap('n', '<A-Tab>', ':tabnext<CR>')
mymap('n', '<C-t>', ':tabnew<CR>')
mymap('n', '<C-Tab>', ':tabnext<CR>')
mymap('n', '<C-S-Tab>', ':tabprevious<CR>')
mymap('n', '<A-1>', ':tabn1<CR>')
mymap('n', '<A-2>', ':tabn2<CR>')
mymap('n', '<A-3>', ':tabn3<CR>')
mymap('n', '<A-4>', ':tabn4<CR>')
mymap('n', '<A-5>', ':tabn5<CR>')
mymap('n', '<A-6>', ':tabn6<CR>')
mymap('n', '<A-7>', ':tabn7<CR>')
mymap('n', '<A-8>', ':tabn8<CR>')
mymap('n', '<A-9>', ':tabn9<CR>')

-- }}} Tabs

-- {{{ Terminal
mymap('t', '<C-Tab>', ':tabnext<CR>')
mymap('t', '<C-S-Tab>', ':tabprevious<CR>')
mymap('t', '<leader><Esc>', '<C-\\><C-n>')
mymap('t', '<A-h>', '<C-\\><C-n><C-w>h')
mymap('t', '<A-j>', '<C-\\><C-n><C-w>j')
mymap('t', '<A-k>', '<C-\\><C-n><C-w>k')
mymap('t', '<A-l>', '<C-\\><C-n><C-w>l')
mymap('t', '<A-S-j>', '<C-\\><C-n>:resize -1<CR>i')
mymap('t', '<A-S-k>', '<C-\\><C-n>:resize +1<CR>i')
mymap('t', '<A-S-l>', '<C-\\><C-n>:vertical resize +1<CR>i')
mymap('t', '<A-S-h>', '<C-\\><C-n>:vertical resize -1<CR>i')
mymap('t', '<A-s>', '<C-\\><C-n><C-w>s')
mymap('t', '<A-v>', '<C-\\><C-n><C-w>v')
mymap('t', '<A-1>', ':tabn1<CR>')
mymap('t', '<A-2>', ':tabn2<CR>')
mymap('t', '<A-3>', ':tabn3<CR>')
mymap('t', '<A-4>', ':tabn4<CR>')
mymap('t', '<A-5>', ':tabn5<CR>')
mymap('t', '<A-6>', ':tabn6<CR>')
mymap('t', '<A-7>', ':tabn7<CR>')
mymap('t', '<A-8>', ':tabn8<CR>')
mymap('t', '<A-9>', ':tabn9<CR>')
-- }}} Terminal

-- {{{ UI bindings

local refresh_gui_font = function()
  vim.opt.guifont = string.format('%s:h%s', vim.g.gui_font_face, vim.g.gui_font_size)
end

local function neovideScale(amount)
  local temp = vim.g.neovide_scale_factor + amount
  if temp < 0.5 then
    return
  end
  vim.g.neovide_scale_factor = temp
end

local resize_gui_font = function(delta)
  vim.g.gui_font_size = o.font_size + delta
  o.font_size = o.font_size + delta
  refresh_gui_font()
  neovideScale(delta / 10)
end

vim.api.nvim_create_user_command('IncreaseGuiFont', function()
  resize_gui_font(1)
end, { bang = true })

vim.api.nvim_create_user_command('DecreaseGuiFont', function()
  resize_gui_font(-1)
end, { bang = true })

mymap('n', '<C-=>', function()
  resize_gui_font(1)
end)
mymap('n', '<C-->', function()
  resize_gui_font(-1)
end)

m.nname('<leader>u', 'UI')
m.nmap('<leader>ud', ':DarkMode<CR>', 'Dark mode')
m.nmap('<leader>ul', ':LightMode<CR>', 'Light Mode')
m.nmap('<leader>ut', ':ToggleDarkMode<CR>', 'Toggle dark/light')
m.nmap('<leader>uu', ':RandomizeBG<CR>', 'Randomize background (waldark)')
m.nmap('<leader>uz', ":lua require('zen-mode').toggle({ window = { width = .85} })<cr>", 'Zenmode')

-- }}} UI bindings

-- {{{ Window bindings
mymap('n', '<A-l>', '<C-w>l')
mymap('n', '<A-j>', '<C-w>j')
mymap('n', '<A-k>', '<C-w>k')
mymap('n', '<A-h>', '<C-w>h')
mymap('n', '<A-s>', '<C-w>s')
mymap('n', '<A-v>', '<C-w>v')
mymap('n', '<A-d>', '<C-w>q')

m.nmap('<A-S-j>', "<CMD>lua require('smart-splits').resize_down()<CR>", 'resize down')
m.nmap('<A-S-k>', "<CMD>lua require('smart-splits').resize_up()<CR>", 'resize up')
m.nmap('<A-S-l>', "<CMD>lua require('smart-splits').resize_right()<CR>", 'resize right')
m.nmap('<A-S-h>', "<CMD>lua require('smart-splits').resize_left()<CR>", 'resize left')

-- mymap('n', '<A-S-j>', ':lua require("smart-splits").resize_down<CR>')
-- mymap('n', '<A-S-k>', ':lua require("smart-splits").resize_up<CR>')
-- mymap('n', '<A-S-l>', ':lua require("smart-splits").resize_right<CR>')
-- mymap('n', '<A-S-h>', ':lua require("smart-splits").resize_left<CR>')

-- mymap('n', '<A-S-j>', ':resize +1<CR>')
-- mymap('n', '<A-S-k>', ':resize -1<CR>')
-- mymap('n', '<A-S-l>', ':vertical resize +1<CR>')
-- mymap('n', '<A-S-h>', ':vertical resize -1<CR>')

-- }}} Window bindings

-- {{{ Debugger
-- m.nmap('<leader>dd', ":lua require'dap-go'.debug_test()<CR>", 'Continue/Start') -- Make this filetype dependent (go)
m.nname('<leader>d', 'Debug')
m.nname('<leader>dl', 'Log')

m.nmap('<leader>dc', "<cmd>lua require'jdtls'.test_class()<cr>", 'Debug Class (Java)')
m.nmap('<leader>dm', "<cmd>lua require'jdtls'.test_nearest_method()<cr>", 'Debug Method (Java)')

m.nmap('<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", 'Breakpoint')
m.nmap(
  '<leader>dB',
  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  'Breakpoint (Cond)'
)
m.nmap(
  '<leader>dlp',
  ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log opint message: '))<CR>",
  'log point'
)

m.nmap('<leader>dd', ":lua require'dap'.continue()<CR>", 'Continue/Start')
m.nmap('<leader>do', ':DapStepOver<CR>', 'StepOver')
m.nmap('<leader>di', ':DapStepInto<CR>', 'StepInto')
m.nmap('<leader>dO', ':DapStepOut<CR>', 'StepOut')
m.nmap('<leader>dr', ":lua require'dap'.repl.open()<CR>", 'Repl')
m.nmap('<leader>dM', ":lua require'jdtls.dap'.setup_dap_main_class_configs()<CR>", 'main (jdtls)')
m.nmap('<leader>dt', ":lua require'neotest'.run.run({strategy = 'dap'})<CR>", 'test')
m.nmap('<leader>du', ":lua require'dapui'.toggle()<CR>", 'UI')

-- }}} Debugger

-- {{{ Todo
mymap('n', '<leader>Ts', ':TodoTrouble<CR>')
mymap('n', '<leader>TT', ':TodoTelescope<CR>')
--  }}}

-- {{{ Snippets
mymap('n', '<leader>yy', ':Telescope ultisnips theme=ivy<CR>')
mymap('n', '<leader>ye', ':UltiSnipsEdit<CR>')
-- }}} Snippets

-- {{{ Telescope
mymap('n', '<leader>pf', ':Telescope fd theme=ivy<CR>')
mymap('n', '<leader>po', ':Telescope project theme=ivy<CR>')
mymap('n', '<leader>pr', ':Telescope live_grep theme=ivy<CR>')
mymap('n', '/', ':Telescope current_buffer_fuzzy_find theme=ivy<CR>')
mymap('n', '<C-p>', ':Telescope <CR>')
mymap('n', '<leader><CR>', ':terminal<CR>')

mymap('n', '<A-x>', ':Telescope commands theme=ivy<CR>')
mymap('i', '<A-x>', ':Telescope commands theme=ivy<CR>')
-- }}} Telescope

-- {{{ Commenting
mymap('v', '<leader>cc', ':CommentToggle<CR>')
mymap('n', '<leader>cc', ':CommentToggle<CR>')

-- mymap("v", "<C-c><C-c>", ":CommentToggle<CR>")
-- mymap("n", "<C-c><C-c>", ":CommentToggle<CR>")

-- }}} Commenting

-- {{{ Jump bindings

m.nname('<leader>d', 'Debug')

mymap('n', '<leader>jj', ':HopChar2<CR>')

-- jump bindings
--
-- j = {
--   name = 'Jump', -- group name
--   a = { ':AnyJump<CR>', 'AnyJump' },
--   b = { ':AnyJumpBack<CR>', 'AnyJumpBack' },
--   j = { ':HopChar2<CR>', 'Jump (HopChar2)' },
--   -- l = { ':AnyJumpLastResult<CR>', 'AnyJumpLastResult' },
--   d = { ':Telescope lsp_definitions<CR>', 'Definition' },
-- },

mymap('n', '<leader>jd', ':Telescope lsp_definitions<CR>')
mymap('n', '<leader>ja', ':AnyJump<CR>')
mymap('n', '<leader>ab', ':AnyJumpBack<CR>')
mymap('n', '<leader>al', ':AnyJumpLastResult<CR>')

-- mymap("n", "<leader>jj", ':lua require("goto-preview").goto_preview_definition()<CR>')
-- mymap("n", "<C-h>", ":lua vim.lsp.buf.hover()<CR>")
-- mymap("n", "<leader>k", ":lua hover.hover()<CR>")

mymap('n', '<leader>jq', ':lua require("goto-preview").close_all_win()<CR>')
mymap('n', '<leader>jt', ':lua require("goto-preview").goto_preview_type_definition()<CR>')
mymap('n', '<leader>ji', ':lua require("goto-preview").goto_preview_implementation()<CR>')
mymap('n', '<leader>jr', ':lua require("goto-preview").goto_preview_references()<CR>')

-- }}} Jump bindings

-- {{{ Test bindings

m.nname('<leader>t', 'Test')
m.nmap('<leader>tt', ":lua require('neotest').run.run()<CR>", 'Run')
m.nmap('<leader>tb', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", 'Buffer')
m.nmap('<leader>tf', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", 'File')
m.nmap('<leader>ts', ":lua require('neotest').summary.toggle()<CR>", 'Summary')
m.nmap('<leader>to', ":lua require('neotest').output_panel.toggle()<CR>", 'Output')
m.nmap('<leader>tz', ':ZenMode<CR>')
-- --   nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
-- --   nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>

-- }}} Test bindings

-- {{{ Java dev bindings
-- -- jdtls test bindings...?
-- -- mymap("n", "<leader>Tc", ":lua require'jdtls'.test_class()<CR>")
-- -- mymap("n", "<leader>Tm", ":lua require'jdtls'.test_nearest_method()<CR>")
-- }}} Java dev bindings

-- {{{ Git bindings
-- Git bindings
-- mymap('n', '<leader>gg', ':Magit<CR>')
mymap('n', '<leader>gg', ':lua require("neogit").open({ kind = "vsplit" })<CR>')
mymap('n', '<leader>gj', ':VGit hunk_down <CR>')
mymap('n', '<leader>gk', ':VGit hunk_up <CR>')

mymap('n', '<leader>gj', ':lua require("gitsigns.actions").next_hunk()<CR>')
mymap('n', '<leader>gk', ':lua require("gitsigns.actions").prev_hunk()<CR>')
mymap('n', '<leader>gs', ':lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>')
-- mymap('n', '<leader>gs', 'lua require"gitsigns".stage_hunk()<CR>')

-- 		['x <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
-- 		['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',

-- mymap('n', '<leader>gs', ':VGit buffer_hunk_stage <CR>')

-- mymap('n', '<leader>gc', ':lua require("neogit").open({ "commit" })<CR>')

-- open using defaults
-- neogit.open()

-- open commit popup
-- neogit.open({ "commit" })

-- open with split kind
-- neogit.open({ kind = "split" })

-- open home directory
-- neogit.open({ cwd = "~" })

mymap('n', '<leader>gb', ':Telescope git_branches theme=ivy<CR>')
mymap('n', '<leader>gc', ':Telescope git_commits theme=ivy<CR>')

-- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
-- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
-- " Only set if you have telescope installed
-- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
--

-- mymap('n', '<leader>gs', ':Telescope git_status theme=ivy<CR>')
mymap('n', '<leader>gf', ':Telescope git_files theme=ivy<CR>')

-- }}}

-- {{{ Help bindings
mymap('n', '<leader>hk', ':Telescope keymaps theme=ivy<CR>')
-- }}} Help bindings

-- {{{ Todo

m.nname('<leader>T', 'Todo')
m.nmap('<leader>TT', ':TodoTrouble<CR>', 'Trouble')

-- }}} Todo

-- {{{ Project bindings

m.nname('<leader>p', 'Project')
m.nmap('<C-k>', ':BuildMe<CR>', 'Build')
m.nmap('<leader>pb', ':BuildMe<CR>', 'Build')
m.nmap('<leader>pf', ':Telescope fd theme=ivy<CR>', 'Files')
m.nmap('<leader>po', ':Telescope project theme=ivy<CR>', 'Open')
-- m.nmap('<leader>pr', ':Telescope live_grep theme=ivy<CR>', 'RipGrep')
m.nmap('<leader>pr', ':lua require("grape").live_grape()<CR>', 'Grape')
m.nmap('<leader>ps', ':split<CR>:terminal<CR>', 'Shell')
--  mymap("n", "<C-k>", ":BuildMe<CR>")

-- }}} Project bindings

-- {{{ language bindings?
mymap('n', '<leader>ll', ':AerialToggle<CR>')
mymap('n', '<leader>ld', ':Neogen<CR>')
-- }}} language bindings?

-- {{{ Rust bindings
-- mymap('n', '<leader>rr', ':RustRunnables<CR>')

m.nmap('<leader>rr', '<Plug>(Luadev-RunLine)', 'Run lua')
m.vmap('<leader>rr', '<Plug>(Luadev-Run)', 'Run lua')
m.nmap('<C-S-p>', '<CMD>BuildMe<CR>', 'Build Project')

-- }}} Rust bindings

-- {{{ Window bindings
mymap('n', '<leader>ww', ':WindowsMaximize<CR>')
-- }}} Window bindings

mymap('n', '<C-h>', ':lua vim.lsp.buf.hover()<CR>')

mymap('n', '<localleader>k', ':lua hover.hover()<CR>')

m.nmap('<C-w><C-t>', ':VentanaTranspose<CR>', 'Transpose')
m.nmap('<C-w><C-f>', ':VentanaShift<CR>', 'Shift')
m.nmap('<C-w>f', ':VentanaShiftMaintainLinear<CR>', 'Shift (maintain linear)')

-- vim.keymap.set("n", "<C-w><C-t>", "<Cmd>VentanaTranspose<CR>")
-- vim.keymap.set("n", <C-w><C-f>",  "<Cmd>VentanaShift<CR>")
-- vim.keymap.set("n", <C-w>f",      "<Cmd>VentanaShiftMaintainLinear<CR>")

-- {{{ Delete builtin marks

function DeleteBuiltinMarks()
  vim.cmd 'delmarks 0-9'
  vim.cmd 'delmarks .'
  vim.cmd 'delmarks ^'
  vim.cmd 'delmarks >'
  vim.cmd 'delmarks <'
  vim.cmd 'delmarks ['
  vim.cmd 'delmarks ]'
end

vim.api.nvim_create_user_command('DeleteBuiltinMarks', function()
  DeleteBuiltinMarks()
end, { nargs = 0, desc = 'Delete all builtin automarks nvim' })

-- }}} Delete builtin marks

-- {{{ My Jump Marks

function MyJumpMarks()
  DeleteBuiltinMarks()
  vim.cmd 'Telescope marks'
end

vim.api.nvim_create_user_command('MyJumpMarks', function()
  MyJumpMarks()
end, { nargs = 0, desc = 'My jump to mark function' })

-- }}} My Jump Marks

mymap('n', '<localleader>mm', ':MyJumpMarks<CR>')

m.nmap('<leader>li', ':lua require("insights").run_current_buf()<CR>', 'Insights')
-- m.nmap('<leader>ps', ':split<CR>:terminal<CR>', 'Shell')

-- map("n", "<C-=>", function()
--   neovideScale(0.1)
-- end)
--
-- map("n", "<C-->", function()
--   neovideScale(-0.1)
-- end)
