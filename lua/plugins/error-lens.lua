-- https://github.com/chikko80/error-lens.nvim

local g = require('globals')


return {
  'chikko80/error-lens.nvim',
  command = 'ErrorLensToggle',
  event = 'BufRead',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local opts = {}
    if g.darkmode then
    opts = {
      -- this setting tries to auto adjust the colors
      -- based on the diagnostic-highlight groups and your
      -- theme background color with a color blender
      enabled = true,
      auto_adjust = {
        enable = false,
        theme_bg = '#281478', -- mandatory if enable true (e.g. #281478)
        step = 5, -- inc: colors should be brighter/darker
        total = 30, -- steps of blender
      },
      prefix = 4, -- distance code <-> diagnostic message
      -- default colors
      colors = {
        error_fg = '#FF6363', -- diagnostic font color
        error_bg = '#4B252C', -- diagnostic line color
        warn_fg = '#FA973A',
        warn_bg = '#303733',
        info_fg = '#5B38E8',
        info_bg = '#281478',
        hint_fg = '#25E64B',
        hint_bg = '#147828',
      },
    }
    else
    opts = {
      -- this setting tries to auto adjust the colors
      -- based on the diagnostic-highlight groups and your
      -- theme background color with a color blender
      enabled = true,
      auto_adjust = {
        enable = false,
        theme_bg = '#F8F8F8', -- mandatory if enable true (e.g. #281478)
        step = 5, -- inc: colors should be brighter/darker
        total = 30, -- steps of blender
      },
      prefix = 4, -- distance code <-> diagnostic message
      -- default colors
      colors = {
        error_fg = '#000000', -- diagnostic font color
        error_bg = '#FF6363', -- diagnostic line color
        warn_fg = '#000000',
        warn_bg = '#F0FFAA',
        info_fg = '#000000',
        info_bg = '#99FFFF',
        hint_fg = '#000000',
        hint_bg = '#99FF99',
      },
    }
    end
    require('error-lens').setup(opts)
  end,
}
