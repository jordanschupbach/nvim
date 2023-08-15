local colors = require 'misenplacecolors.colors'
local c = require 'misenplacecolors.colors'

local M = {

  DapBreakpoint = { fg = '#993939', bg = '#ffe0db' },
  DapLogPoint = { bg = '#f2d283', fg = '#61afef' },
  DapStopped = { bg = '#d1ffd7', fg = '#98c379' },

  ErrorLensError = { fg = '#760202', bg = '#ffd0cb' },
  ErrorLensWarn = { fg = '#765402', bg = '#f2d283' },
  ErrorLensInfo = { fg = '#06005e', bg = '#d2d1ff' },
  ErrorLensHint = { fg = '#225e00', bg = '#d1ffd7' },

  -- {{{ Editor

  -- -- VisualNOS	Visual mode selection when vim is "Not Owning the Selection".

  CursorColumn = { link = 'CursorLine' },
  -- -- CursorLine	Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.

  -- }}} Editor

  -- {{{ Editor

  -- ColorColumn	Used for the columns set with 'colorcolumn'.
  ColorColumn = { bg = '#f2d283' },

  -- -- Conceal		Placeholder characters substituted for concealed text (see 'conceallevel').
  -- Conceal = { fg = theme.ui.special, bold = true },
  -- -- CurSearch	Used for highlighting a search pattern under the cursor (see 'hlsearch').
  -- CurSearch = { fg = theme.ui.fg, bg = theme.ui.bg_search, bold = true },
  -- -- Cursor		Character under the cursor.
  Cursor = { fg = colors.underworld, bg = colors.underworld },
  -- -- lCursor		Character under the cursor when |language-mapping| is used (see 'guicursor').
  -- lCursor = { link = "Cursor" },
  -- -- CursorIM	Like Cursor, but used when in IME mode.
  -- CursorIM = { link = "Cursor" },
  -- -- CursorColumn	Screen-column at the cursor, when 'cursorcolumn' is set.
  -- CursorColumn = { link = "CursorLine" },
  -- -- CursorLine	Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
  -- CursorLine = { bg = theme.ui.bg_p2 },

  CursorLine = { bg = '#f3f3f3' },
  CursorLineNr = { fg = colors.veronica, bg = colors.pastelFirstSnow, bold = true },

  -- -- Directory	Directory names (and other special names in listings).
  -- Directory = { fg = theme.syn.fun },
  -- -- DiffAdd		Diff mode: Added line. |diff.txt|
  -- DiffAdd = { bg = theme.diff.add },
  -- -- DiffChange	Diff mode: Changed line. |diff.txt|
  -- DiffChange = { bg = theme.diff.change },
  -- -- DiffDelete	Diff mode: Deleted line. |diff.txt|
  -- DiffDelete = { fg = theme.vcs.removed, bg = theme.diff.delete },
  -- -- DiffText	Diff mode: Changed text within a changed line. |diff.txt|
  -- DiffText = { bg = theme.diff.text },
  -- -- EndOfBuffer	Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
  EndOfBuffer = { fg = colors.phillipineOrange },
  -- -- TermCursor	Cursor in a focused terminal.
  -- -- TermCursorNC	Cursor in an unfocused terminal.
  -- -- ErrorMsg	Error messages on the command line.
  -- ErrorMsg = { fg = theme.diag.error },

  -- LineNr		Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  LineNr = { fg = colors.underworld, bg = '#f3f3f3' },

  -- -- WinSeparator	Separators between window splits.
  -- WinSeparator = { fg = theme.ui.bg_m3, bg = config.dimInactive and theme.ui.bg_dim or "NONE" },
  -- VertSplit = { link = "WinSeparator" },
  -- Folded		Line used for closed folds.
  Folded = { fg = colors.underworld, bg = colors.pastelFirstSnow },

  -- FoldColumn	'foldcolumn'
  FoldColumn = { fg = colors.underworld, bg = '#f3f3f3' },
  -- SignColumn	Column where |signs| are displayed.
  SignColumn = { fg = colors.underworld, bg = '#f3f3f3' },
  -- -- IncSearch	'incsearch' highlighting; also used for the text replaced with ":s///c".
  -- IncSearch = { fg = theme.ui.fg_reverse, bg = theme.diag.warning },
  -- -- Substitute	|:substitute| replacement text highlighting.
  -- Substitute = { fg = theme.ui.fg, bg = theme.vcs.removed },
  -- -- LineNr		Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  -- LineNr = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
  -- -- LineNrAbove	Line number for when the 'relativenumber' option is set, above the cursor line.
  -- -- LineNrBelow	Line number for when the 'relativenumber' option is set, below the cursor line.
  -- -- CursorLineNr	Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is "both", for the cursor line.
  -- CursorLineNr = { fg = theme.diag.warning, bg = theme.ui.bg_gutter, bold = true },
  -- -- CursorLineFold	Like FoldColumn when 'cursorline' is set for the cursor line.
  -- -- CursorLineSign	Like SignColumn when 'cursorline' is set for the cursor line.
  --
  CursorLineFold = { fg = colors.underworld, bg = colors.underworld },
  CursorLineSign = { fg = colors.underworld, bg = colors.underworld },
  -- -- MatchParen	Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
  -- MatchParen = { fg = theme.diag.warning, bold = true },
  -- -- ModeMsg		'showmode' message (e.g., "-- INSERT --").
  -- ModeMsg = { fg = theme.diag.warning, bold = true },
  -- -- MsgArea		Area for messages and cmdline.
  -- MsgArea = vim.o.cmdheight == 0 and {link = 'StatusLine'} or { fg = theme.ui.fg_dim },
  -- -- MsgSeparator	Separator for scrolled messages |msgsep|.
  -- MsgSeparator = { bg = vim.o.cmdheight == 0 and theme.ui.bg or theme.ui.bg_m3 },
  -- -- MoreMsg		|more-prompt|
  -- MoreMsg = { fg = theme.diag.info },
  -- -- NonText		'@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
  NonText = { fg = '#645aff' },
  -- -- Normal		Normal text.
  -- Normal = { fg = theme.ui.fg, bg = not config.transparent and theme.ui.bg or "NONE" },
  -- -- NormalFloat	Normal text in floating windows.
  -- NormalFloat = { fg = theme.ui.float.fg, bg = theme.ui.float.bg },
  -- -- FloatBorder	Border of floating windows.
  FloatBorder = { fg = '#645aff', bg = c.vibrantMint },
  -- -- FloatTitle	Title of floating windows.
  -- FloatTitle = { fg = theme.ui.special, bg = theme.ui.float.bg_border, bold = true },
  -- -- NormalNC	Normal text in non-current windows.
  -- NormalNC = config.dimInactive and { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim } or { link = "Normal" },
  -- -- Pmenu		Popup menu: Normal item.
  Pmenu = { fg = colors.underworld, bg = '#ffe8e8' },
  -- PmenuSel	Popup menu: Selected item.
  PmenuSel = { fg = colors.underworld, bg = '#ffc8c8' },
  -- -- PmenuSbar	Popup menu: Scrollbar.
  PmenuSbar = { bg = '#ffc8c8' },
  -- -- PmenuThumb	Popup menu: Thumb of the scrollbar.
  PmenuThumb = { bg = '#ffc8c8' },
  -- -- Question	|hit-enter| prompt and yes/no questions.
  -- Question = { link = "MoreMsg" },
  -- -- QuickFixLine	Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  -- QuickFixLine = { bg = theme.ui.bg_p1 },
  -- -- Search		Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  -- Search = { fg = theme.ui.fg, bg = theme.ui.bg_search },
  -- -- SpecialKey	Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
  -- SpecialKey = { fg = theme.ui.special },
  -- -- SpellBad	Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  -- SpellBad = { undercurl = config.undercurl, underline = not config.undercurl, sp = theme.diag.error },
  -- -- SpellCap	Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  -- SpellCap = { undercurl = config.undercurl, underline = not config.undercurl, sp = theme.diag.warning },
  -- -- SpellLocal	Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  -- SpellLocal = { undercurl = config.undercurl, underline = not config.undercurl, sp = theme.diag.warning },
  -- -- SpellRare	Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
  -- SpellRare = { undercurl = config.undercurl, underline = not config.undercurl, sp = theme.diag.warning },
  -- StatusLine	Status line of current window.
  -- StatusLine = { fg = colors.underworld, bg = '#ffeaff' },
  StatusLine = { fg = colors.underworld, bg = '#eeeaee' },
  -- StatusLineNC	Status lines of not-current windows. Note: If this is equal to "StatusLine", Vim will use "^^^" in the status line of the current window.
  StatusLineNC = { fg = colors.phillipineOrange, bg = colors.pastelSnow },
  -- TabLine		Tab pages line, not active tab page label.
  TabLine = { fg = colors.underworld, bg = colors.pastelSnow },
  -- TabLineFill	Tab pages line, where there are no labels.
  TabLineFill = { bg = colors.pastelFirstSnow },
  -- TabLineSel	Tab pages line, active tab page label.
  TabLineSel = { fg = '#ffd0ff', bg = '#ffd0ff' },
  -- -- Title		Titles for output from ":set all", ":autocmd" etc.
  -- Title = { fg = theme.syn.fun, bold = true },
  -- Visual		Visual mode selection.
  Visual = { bg = colors.pastelFirstSnow },
  -- -- VisualNOS	Visual mode selection when vim is "Not Owning the Selection".
  -- VisualNOS = { link = "Visual" },
  -- -- WarningMsg	Warning messages.
  -- WarningMsg = { fg = theme.diag.warning },
  -- -- Whitespace	"nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.
  -- Whitespace = { fg = theme.ui.whitespace },
  -- -- WildMenu	Current match in 'wildmenu' completion.
  -- WildMenu = { link = "Pmenu" },
  -- -- WinBar		Window bar of current window.
  -- Winbar = { fg = theme.ui.fg_dim, bg = "NONE" },
  -- -- WinBarNC	Window bar of not-current windows.
  -- WinbarNC = { fg = theme.ui.fg_dim, bg = config.dimInactive and theme.ui.bg_dim or "NONE" },

  SignColumnSB = { fg = colors.underworld, bg = colors.smokedBlackCoffee },
  -- -- SignColumnSB = { link = "SignColumn" },
  -- -- NormalSB = { link = "Normal" },

  -- debugPC = { bg = theme.diff.delete },
  debugBreakpoint = { fg = colors.underworld, bg = colors.smokedBlackCoffee },
  -- DapBreakpoint = { text = '•', texthl = 'red', linehl = '', numhl = '' },
  -- DapBreakpoint = { text = '•'},

  -- LspReferenceText = { bg = theme.diff.text },
  -- LspReferenceRead = { link = "LspReferenceText" },
  -- LspReferenceWrite = { bg = theme.diff.text, underline = true },
  -- -- LspInlayHint = { link = "NonText"},

  -- DiagnosticError = { fg = theme.diag.error },
  -- DiagnosticWarn = { fg = theme.diag.warning },
  -- DiagnosticInfo = { fg = theme.diag.info },
  -- DiagnosticHint = { fg = theme.diag.hint },
  -- DiagnosticOk = { fg = theme.diag.ok },

  -- DiagnosticSignError = { fg = theme.diag.error, bg = theme.ui.bg_gutter },
  -- DiagnosticSignWarn = { fg = theme.diag.warning, bg = theme.ui.bg_gutter },
  -- DiagnosticSignInfo = { fg = theme.diag.info, bg = theme.ui.bg_gutter },
  -- DiagnosticSignHint = { fg = theme.diag.hint, bg = theme.ui.bg_gutter },

  DiagnosticVirtualTextError = { link = 'DiagnosticError' },
  DiagnosticVirtualTextWarn = { link = 'DiagnosticWarn' },
  DiagnosticVirtualTextInfo = { link = 'DiagnosticInfo' },
  DiagnosticVirtualTextHint = { link = 'DiagnosticHint' },

  -- DiagnosticUnderlineError = { undercurl = config.undercurl, underline = not config.undercurl, sp = theme.diag.error },
  -- DiagnosticUnderlineWarn = { undercurl = config.undercurl, underline = not config.undercurl, sp = theme.diag.warning },
  -- DiagnosticUnderlineInfo = { undercurl = config.undercurl, underline = not config.undercurl, sp = theme.diag.info },
  -- DiagnosticUnderlineHint = { undercurl = config.undercurl, underline = not config.undercurl, sp = theme.diag.hint },

  -- LspSignatureActiveParameter = { fg = theme.diag.warning },
  LspCodeLens = { fg = colors.underworld, bg = colors.smokedBlackCoffee },

  -- -- vcs
  -- diffAdded = { fg = theme.vcs.added },
  -- diffRemoved = { fg = theme.vcs.removed },
  -- diffDeleted = { fg = theme.vcs.removed },
  -- diffChanged = { fg = theme.vcs.changed },
  -- diffOldFile = { fg = theme.vcs.removed },
  -- diffNewFile = { fg = theme.vcs.added },
  -- -- diffFile = { fg = c.steelGray },
  -- -- diffLine = { fg = c.steelGray },
  -- -- diffIndexLine = { link = 'Identifier' },

  -- }}} Editor

  -- ActionFix = { fg = colors.underworld, bg = colors.underworld},
  -- CodeActionText = { fg = colors.underworld, bg = colors.underworld},
  SpecialKey = { fg = c.underworld, bg = c.pastelFirstSnow },
  Directory = { fg = c.underworld, bg = c.pastelOliveCreed },
  -- TabLine = { fg = c.underworld, bg = c.pastelFirstSnow },

  DiagnosticError = { fg = '#760202', bg = '#ffd0cb' },

  DiagnosticWarning = { fg = colors.phillipineOrange, bg = '#ffdca3' },
  DiagnosticWarn = { fg = colors.phillipineOrange, bg = '#ffdca3' },
  DiagnosticText = { fg = colors.trackAndField, bg = colors.pastelFirstSnow },
  DiagnosticOk = { fg = colors.trackAndField, bg = colors.pastelFirstSnow },
  DiagnosticHint = { fg = colors.bluePartyParrot, bg = '#d1ffd7' },
  DiagnosticInfo = { fg = colors.smokedBlackCoffee, bg = '#d2d1ff' },

  ModeMsg = { fg = colors.phillipineOrange, bg = colors.pastelFirstSnow },
  WinBar = { fg = colors.phillipineOrange, bg = colors.pastelFirstSnow },
  lCursor = { fg = colors.phillipineOrange, bg = colors.pastelFirstSnow },
  FloatShadow = { fg = colors.phillipineOrange, bg = colors.pastelFirstSnow },
  FloatShadowThrough = { fg = colors.phillipineOrange, bg = colors.pastelFirstSnow },
  Ignore = { fg = colors.phillipineOrange, bg = colors.pastelFirstSnow },

  MarkSignNumHL = { fg = colors.phillipineOrange, bg = '#f3c3f3' },
  MarkSignHL = { fg = colors.phillipineOrange, bg = '#f3f3f3' },
  MarkVirtTextHL = { fg = colors.phillipineOrange, bg = '#f3f3f3' },

  -- Error = { fg = colors.underworld, bg = colors.underworld},
  Normal = { fg = colors.rhodoniteBrown, bg = colors.pastelSnow },
  -- Comment = { fg = colors.underworld, bg = colors.underworld},

  LspInfoTip = { fg = colors.underworld, bg = colors.phillipineOrange },
  LspInlayHint = { fg = colors.underworld, bg = colors.phillipineOrange },
  LspCodeLens = { fg = colors.underworld, bg = colors.pastelFirstSnow },
  LspLens = { fg = colors.underworld, bg = colors.pastelFirstSnow },

  -- CodeActionText = { fg = colors.underworld, bg = colors.underworld},
  -- ActionFix = { fg = colors.underworld, bg = colors.underworld},
  -- MarkSign = { fg = colors.underworld, bg = colors.underworld},
  CursorLineMarkSignHL = { fg = colors.underworld, bg = colors.underworld },
  CursorLineMarkSignNumHL = { fg = colors.underworld, bg = colors.underworld },
  CursorLineMarkVirtTextHL = { fg = colors.underworld, bg = colors.underworld },
  PyLogo = { fg = colors.bluePartyParrot, bg = colors.pastelFirstSnow },
  ShellLogo = { fg = colors.midnightBlack, bg = colors.pastelFirstSnow },
  JSLogo = { fg = colors.midnightBlack, bg = colors.pastelFirstSnow },

  -- {{{ Plugins
  --
  GitSignsAdd = { fg = colors.indiaGreen, bg = '#f3f3f3', bold = true },
  GitSignsChange = { fg = colors.phillipineOrange, bg = '#f3f3f3' },
  GitSignsDelete = { fg = colors.trackAndField, bg = '#f3f3f3' },

  TroubleTextError = { fg = '#760202', bg = '#ffd0cb' },
  TroubleTextWarning = { fg = colors.phillipineOrange, bg = '#ffdca3' },

  -- }}} Plugins

  -- {{{ Plugins all
  -- -- Neovcs
  -- -- NeovcsBranch = {},
  -- -- NeovcsRemote = {},
  -- -- NeovcsDiffDelete = { fg = theme.vcs.removed, bg = theme.diff.delete },
  -- -- NeovcsDiffAdd = { fg = theme.vcs.added, bg = theme.diff.add },
  -- -- NeovcsHunkHeader = { fg = theme.syn.identifier },
  -- -- NeovcsDiffContextHighlight = { bg = theme.diff.change },

  -- -- vcsSigns
  -- -- vcsSignsAdd = { link = "diffAdded" },
  -- -- vcsSignsChange = { link = "diffChanged" },
  -- -- vcsSignsDelete = { link = "diffDeleted" },
  -- -- vcsSignsDeleteLn = { bg = theme.diff.delete },

  -- -- Gitsigns
  -- GitSignsAdd = { fg = theme.vcs.added, bg = theme.ui.bg_gutter },
  -- GitSignsChange = { fg = theme.vcs.changed, bg = theme.ui.bg_gutter },
  -- GitSignsDelete = { fg = theme.vcs.removed, bg = theme.ui.bg_gutter },
  -- -- Neogit
  -- NeogitDiffContextHighlight = { bg = theme.diff.change }, --[[  guibg=#333333 guifg=#b2b2b2 ]]
  -- NeogitHunkHeader = { fg = theme.syn.fun }, --[[  guifg=#cccccc guibg=#404040 ]]
  -- NeogitHunkHeaderHighlight = { fg = theme.syn.constant, bg = theme.diff.change }, --[[ guifg=#cccccc guibg=#4d4d4d ]]
  -- NeogitDiffAddHighlight = { bg = theme.diff.add },
  -- NeogitDiffDeleteHighlight = { bg = theme.diff.delete },
  -- -- TreeSitter Extensions
  -- TreesitterContext = { link = "Folded" },
  -- TreesitterContextLineNumber = { fg = theme.ui.special, bg = theme.ui.bg_gutter },
  -- -- Telescope
  -- TelescopeBorder = { fg = theme.ui.float.fg_border, bg = theme.ui.bg },
  -- TelescopeTitle = { fg = theme.ui.special },
  -- TelescopeSelection = { link = 'CursorLine' },
  -- TelescopeSelectionCaret = { link = 'CursorLineNr' },
  -- TelescopeResultsClass = { link = "Structure" },
  -- TelescopeResultsStruct = { link = "Structure" },
  -- TelescopeResultsField = { link = "@field" },
  -- TelescopeResultsMethod = { link = "Function" },
  -- TelescopeResultsVariable = { link = "@variable" },
  -- -- NvimTree
  -- -- NvimTreeNormal = { link = "Normal" },
  NvimTreeNormal = { bg = '#eeeeee' },
  NvimTreeNormalNC = { bg = '#eeeeee' },
  NvimTreeCursorLine = { bg = '#feeeee' },
  NvimTreeCursorLineNC = { bg = '#feeeee' },
  -- NvimTreeLineNr = { bg = '#eeeeee' },
  -- NvimTreeLineNr = { bg = '#eeeeee' },
  -- NvimTreeRootFolder = { fg = theme.syn.identifier, bold = true },
  -- NvimTreeGitDirty = { fg = theme.vcs.changed },
  -- NvimTreeGitNew = { fg = theme.vcs.added },
  -- NvimTreeGitDeleted = { fg = theme.vcs.removed },
  -- NvimTreeGitStaged = { fg = theme.vcs.added },
  -- NvimTreeSpecialFile = { fg = theme.syn.special1 },
  -- -- NvimTreeIndentMarker           = {},
  -- NvimTreeImageFile = { fg = theme.syn.special2 },
  -- NvimTreeSymlink = { link = "Type" },
  -- NvimTreeFolderName = { link = "Directory" },
  -- NvimTreeExecFile = { fg = theme.syn.string, bold = true },
  -- NvimTreeOpenedFile = { fg = theme.syn.special1, italic = true },
  -- NvimTreeWinSeparator = { link = "WinSeparator" },
  -- NvimTreeWindowPicker = { bg = theme.ui.bg_m1, fg = theme.syn.special1, bold = true },
  -- -- NeoTree
  -- NeoTreeTabInactive = { link = "TabLine" },
  -- NeoTreeTabActive = { link = "TabLineSel" },
  -- NeoTreeTabSeparatorInactive = { link = "NeoTreeTabInactive" },
  -- NeoTreeTabSeparatorActive = { link = "NeoTreeTabActive" },
  -- NeoTreeRootName = { fg = theme.syn.identifier, bold = true },
  -- NeoTreeModified = { link = "String" },
  -- NeoTreeGitModified = { fg = theme.vcs.changed },
  -- NeoTreeGitAdded = { fg = theme.vcs.added },
  -- NeoTreeGitDeleted = { fg = theme.vcs.removed },
  -- NeoTreeGitStaged = { fg = theme.vcs.added },
  -- NeoTreeGitConflict = { fg = theme.diag.error },
  -- NeoTreeGitUntracked = { link = "NeoTreeGitModified", default = true },
  -- NeoTreeGitUnstaged = { link = "NeoTreeGitModified", default = true },
  -- NeoTreeIndentMarker = { link = "NonText" },
  -- -- WindowPicker
  -- -- NvimWindowSwitch = { bg = theme.ui.bg_m3, fg = theme.diag.warning },
  -- -- NvimWindowSwitchNC = { link = "NvimWindowSwitch" },
  -- -- Dashboard
  -- DashboardShortCut = { fg = theme.syn.special1 },
  -- DashboardHeader = { fg = theme.vcs.removed },
  -- DashboardCenter = { fg = theme.syn.identifier },
  -- DashboardFooter = { fg = theme.syn.comment },
  -- DashboardDesc = { fg = theme.syn.identifier },
  -- DashboardKey = { fg = theme.syn.special1 },
  -- DashboardIcon = { fg = theme.ui.special },
  -- -- Notify
  -- NotifyBackground = { bg = theme.ui.bg },
  -- NotifyERRORBorder = { link = "DiagnosticError" },
  -- NotifyWARNBorder = { link = "DiagnosticWarn" },
  -- NotifyINFOBorder = { link = "DiagnosticInfo" },
  -- NotifyHINTBorder = { link = "DiagnosticHint" },
  -- NotifyDEBUGBorder = { link = "Debug" },
  -- NotifyTRACEBorder = { link = "Comment" },
  -- NotifyERRORIcon = { link = "DiagnosticError" },
  -- NotifyWARNIcon = { link = "DiagnosticWarn" },
  -- NotifyINFOIcon = { link = "DiagnosticInfo" },
  -- NotifyHINTIcon = { link = "DiagnosticHint" },
  -- NotifyDEBUGIcon = { link = "Debug" },
  -- NotifyTRACEIcon = { link = "Comment" },
  -- NotifyERRORTitle = { link = "DiagnosticError" },
  -- NotifyWARNTitle = { link = "DiagnosticWarn" },
  -- NotifyINFOTitle = { link = "DiagnosticInfo" },
  -- NotifyHINTTitle = { link = "DiagnosticHint" },
  -- NotifyDEBUGTitle = { link = "Debug" },
  -- NotifyTRACETitle = { link = "Comment" },
  -- -- Dap-UI
  -- -- DapUIVariable = { link = "Normal" },
  -- DapUIScope = { link = "Special" },                                        -- guifg=#00F1F5"
  -- DapUIType = { link = "Type" },                                            -- guifg=#D484FF"
  -- -- DapUIValue = { link = "Normal" },
  -- DapUIModifiedValue = { fg = theme.syn.special1, bold = true },            -- guifg=#00F1F5 gui=bold"
  -- DapUIDecoration = { fg = theme.ui.float.fg_border },                      -- guifg=#00F1F5"
  -- DapUIThread = { fg = theme.syn.identifier },                              --guifg=#A9FF68"
  -- DapUIStoppedThread = { fg = theme.syn.special1 },                         --guifg=#00f1f5"
  -- -- DapUIFrameName = { link = "Normal"},
  -- DapUISource = { fg = theme.syn.special2 },                                -- guifg=#D484FF"
  -- DapUILineNumber = { fg = theme.syn.special1 },                            -- guifg=#00f1f5"
  -- DapUIFloatBorder = { fg = theme.ui.float.fg_border },                     -- guifg=#00F1F5"
  -- DapUIWatchesEmpty = { fg = theme.diag.error },                            -- guifg=#F70067"
  -- DapUIWatchesValue = { fg = theme.syn.identifier },                        -- guifg=#A9FF68"
  -- DapUIWatchesError = { fg = theme.diag.error },                            --guifg=#F70067"
  -- DapUIBreakpointsPath = { link = "Directory" },                            --guifg=#00F1F5"
  -- DapUIBreakpointsInfo = { fg = theme.diag.info },                          --guifg=#A9FF68"
  -- DapUIBreakpointsCurrentLine = { fg = theme.syn.identifier, bold = true }, --guifg=#A9FF68 gui=bold"
  -- -- DapUIBreakpointsLine = {}, -- DapUILineNumber"
  -- DapUIBreakpointsDisabledLine = { link = "Comment" },                      --guifg=#424242"
  -- -- DapUICurrentFrameName = {}, -- DapUIBreakpointsCurrentLine"
  -- DapUIStepOver = { fg = theme.syn.special1 },                              --guifg=#00f1f5"
  -- DapUIStepInto = { fg = theme.syn.special1 },                              --guifg=#00f1f5"
  -- DapUIStepBack = { fg = theme.syn.special1 },                              --guifg=#00f1f5"
  -- DapUIStepOut = { fg = theme.syn.special1 },                               --guifg=#00f1f5"
  -- DapUIStop = { fg = theme.diag.error },                                    --guifg=#F70067"
  -- DapUIPlayPause = { fg = theme.syn.string },                               --guifg=#A9FF68"
  -- DapUIRestart = { fg = theme.syn.string },                                 --guifg=#A9FF68"
  -- DapUIUnavailable = { fg = theme.syn.comment },                            --guifg=#424242"
  -- -- Floaterm
  -- FloatermBorder = { fg = theme.ui.float.fg_border, bg = theme.ui.bg },
  -- -- NeoVim                         = {},
  -- healthError = { fg = theme.diag.error },
  -- healthSuccess = { fg = theme.diag.ok },
  -- healthWarning = { fg = theme.diag.warning },
  -- -- Cmp
  -- CmpDocumentation = { link = "NormalFloat" },
  -- CmpDocumentationBorder = { link = "FloatBorder" },
  -- CmpCompletion = { link = "Pmenu" },
  -- CmpCompletionSel = { fg = "NONE", bg = theme.ui.pmenu.bg_sel },
  -- CmpCompletionBorder = { fg = theme.ui.bg_search, bg = theme.ui.pmenu.bg },
  -- CmpCompletionThumb = { link = "PmenuThumb" },
  -- CmpCompletionSbar = { link = "PmenuSbar" },
  -- CmpItemAbbr = { fg = theme.ui.pmenu.fg },
  -- CmpItemAbbrDeprecated = { fg = theme.syn.comment, strikethrough = true },
  -- CmpItemAbbrMatch = { fg = theme.syn.fun },
  -- CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
  -- CmpItemKindDefault = { fg = theme.syn.deprecated },
  -- CmpItemMenu = { fg = theme.syn.comment },
  -- CmpItemKindVariable = { fg = theme.ui.fg_dim },
  -- CmpItemKindFunction = { link = "Function" },
  -- CmpItemKindMethod = { link = "Function" },
  -- CmpItemKindConstructor = { link = "@constructor" },
  -- CmpItemKindClass = { link = "Type" },
  -- CmpItemKindInterface = { link = "Type" },
  -- CmpItemKindStruct = { link = "Type" },
  -- CmpItemKindProperty = { link = "@property" },
  -- CmpItemKindField = { link = "@field" },
  -- CmpItemKindEnum = { link = "Type" },
  -- CmpItemKindSnippet = { fg = theme.syn.special1 },
  -- CmpItemKindText = { fg = theme.ui.pmenu.fg },
  -- CmpItemKindModule = { link = "@include" },
  -- CmpItemKindFile = { link = "Directory" },
  -- CmpItemKindFolder = { link = "Directory" },
  -- CmpItemKindKeyword = { link = "@keyword" },
  -- CmpItemKindTypeParameter = { link = "Type" },
  -- CmpItemKindConstant = { link = "Constant" },
  -- CmpItemKindOperator = { link = "Operator" },
  -- CmpItemKindReference = { link = "Type" },
  -- CmpItemKindEnumMember = { link = "Constant" },
  -- CmpItemKindValue = { link = "String" },
  -- CmpItemKindCopilot = { link = "String" },
  -- -- CmpItemKindUnit = {},
  -- -- CmpItemKindEvent = {},
  -- -- CmpItemKindColor = {},

  -- -- IndentBlankline
  -- IndentBlanklineChar = { fg = theme.ui.whitespace },
  -- IndentBlanklineSpaceChar = { fg = theme.ui.whitespace },
  -- IndentBlanklineSpaceCharBlankline = { fg = theme.ui.whitespace },
  -- IndentBlanklineContextChar = { fg = theme.ui.special },
  -- IndentBlanklineContextStart = { sp = theme.ui.special, underline = true },
  -- -- Lazy
  -- LazyProgressTodo = { fg = theme.ui.nontext },

  -- }}} Plugins

  -- {{{ Syntax
  -- -- *Comment	any comment
  -- Comment = vim.tbl_extend("force", { fg = theme.syn.comment }, config.commentStyle),
  --
  -- -- *Constant	any constant
  -- Constant = { fg = theme.syn.constant },
  -- --  String		a string constant: "this is a string"
  -- String = { fg = theme.syn.string },
  -- --  Character	a character constant: 'c', '\n'
  -- Character = { link = "String" },
  -- --  Number		a number constant: 234, 0xff
  -- Number = { fg = theme.syn.number },
  -- --  Boolean	a boolean constant: TRUE, false
  -- Boolean = { fg = theme.syn.constant, bold = true },
  -- --  Float		a floating point constant: 2.3e10
  -- Float = { link = "Number" },
  --
  -- -- *Identifier	any variable name
  -- Identifier = { fg = theme.syn.identifier },
  -- --  Function	function name (also: methods for classes)
  -- Function = vim.tbl_extend("force", { fg = theme.syn.fun }, config.functionStyle),
  --
  -- -- *Statement	any statement
  -- Statement = vim.tbl_extend("force", { fg = theme.syn.statement }, config.statementStyle),
  -- --  Conditional	if, then, else, endif, switch, etc.
  -- --  Repeat		for, do, while, etc.
  -- --  Label		case, default, etc.
  -- --  Operator	"sizeof", "+", "*", etc.
  -- Operator = { fg = theme.syn.operator },
  -- --  Keyword	any other keyword
  -- Keyword = vim.tbl_extend("force", { fg = theme.syn.keyword }, config.keywordStyle),
  -- --  Exception	try, catch, throw
  -- Exception = { fg = theme.syn.special2 },
  --
  -- -- *PreProc	generic Preprocessor
  -- PreProc = { fg = theme.syn.preproc },
  -- --  Include	preprocessor #include
  -- --  Define		preprocessor #define
  -- --  Macro		same as Define
  -- --  PreCondit	preprocessor #if, #else, #endif, etc.
  --
  -- -- *Type		int, long, char, etc.
  -- Type = vim.tbl_extend("force", { fg = theme.syn.type }, config.typeStyle),
  -- --  StorageClass	static, register, volatile, etc.
  -- --  Structure	struct, union, enum, etc.
  -- --  Typedef	A typedef
  --
  -- -- *Special	any special symbol
  -- Special = { fg = theme.syn.special1 },
  -- --  SpecialChar	special character in a constant
  -- --  Tag		you can use CTRL-] on this
  -- --  Delimiter	character that needs attention
  -- Delimiter = { fg = theme.syn.punct },
  -- --  SpecialComment	special things inside a comment
  -- --  Debug		debugging statements
  --
  -- -- *Underlined	text that stands out, HTML links
  -- Underlined = { fg = theme.syn.special1, underline = true },
  -- Bold = { bold = true },
  -- Italic = { italic = true },
  --
  -- -- *Ignore		left blank, hidden  |hl-Ignore|
  -- Ignore = { link = "NonText" },
  --
  -- -- *Error		any erroneous construct
  -- Error = { fg = theme.diag.error },
  --
  -- -- *Todo		anything that needs extra attention; mostly the keywords TODO FIXME WARNING and XXX
  -- Todo = { fg = theme.ui.fg_reverse, bg = theme.diag.info, bold = true },
  --
  -- qfLineNr = { link = "lineNr" },
  -- qfFileName = { link = "Directory" },
  --
  -- -- htmlH1 = {},
  -- -- htmlH2 = {},
  --
  -- -- mkdHeading = {},
  -- -- mkdCode = {},
  -- -- mkdCodeDelimiter = {},
  -- -- mkdCodeStart = {},
  -- -- mkdCodeEnd = {},
  -- -- mkdLink = {},
  --
  -- -- markdownHeadingDelimiter = {},
  -- markdownCode = { fg = theme.syn.string },
  -- markdownCodeBlock = { fg = theme.syn.string },
  -- markdownEscape = { fg = "NONE" },
  -- -- markdownH1 = {},
  -- -- markdownH2 = {},
  -- -- markdownLinkText = {},

  -- }}} Syntax
}
return M
