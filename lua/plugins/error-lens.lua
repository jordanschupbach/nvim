-- https://github.com/chikko80/error-lens.nvim

-- local g = require 'global-vars'
-- print("Darkmode: " .. tostring(g.darkmode))

return {
  'chikko80/error-lens.nvim',
  command = 'ErrorLensToggle',
  event = { 'BufWrite', 'BufRead' },
  -- event = 'BufRead',

  -- {{{ dependencies
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'rebelot/heirline.nvim',
    'mfussenegger/nvim-jdtls',
  },
  -- }}} dependencies

  config = function()
    local utils = require 'heirline.utils'
    local opts = {
      -- this setting tries to auto adjust the colors
      -- based on the diagnostic-highlight groups and your
      -- theme background color with a color blender
      enabled = true,
      -- auto_adjust = {
      --   enable = false,
      --   theme_bg = '#281478', -- mandatory if enable true (e.g. #281478)
      --   step = 5, -- inc: colors should be brighter/darker
      --   total = 30, -- steps of blender
      -- },
      prefix = 4, -- distance code <-> diagnostic message
      -- default colors
      colors = {
        error_fg = utils.get_highlight('ErrorLensError').fg,
        error_bg = utils.get_highlight('ErrorLensError').bg,
        warn_fg = utils.get_highlight('ErrorLensWarn').fg,
        warn_bg = utils.get_highlight('ErrorLensWarn').bg,
        info_fg = utils.get_highlight('ErrorLensInfo').fg,
        info_bg = utils.get_highlight('ErrorLensInfo').bg,
        hint_fg = utils.get_highlight('ErrorLensHint').fg,
        hint_bg = utils.get_highlight('ErrorLensHint').bg,
      },
    }
    require('error-lens').setup(opts)
  end,
}
