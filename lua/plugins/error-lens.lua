-- https://github.com/chikko80/error-lens.nvim

local g = require('global-vars')
-- print("Darkmode: " .. tostring(g.darkmode))

return {
  'chikko80/error-lens.nvim',
  command = 'ErrorLensToggle',
  event = { 'BufWrite', 'BufRead' },
  -- event = 'BufRead',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
      opts = {
        -- this setting tries to auto adjust the colors
        -- based on the diagnostic-highlight groups and your
        -- theme background color with a color blender
        enabled = false,
        -- auto_adjust = {
        --   enable = false,
        --   theme_bg = '#281478', -- mandatory if enable true (e.g. #281478)
        --   step = 5, -- inc: colors should be brighter/darker
        --   total = 30, -- steps of blender
        -- },
        prefix = 4, -- distance code <-> diagnostic message
        -- default colors
        colors = {
          error_fg = '#FF6363', -- diagnostic font color
          error_bg = '#4B252C', -- diagnostic line color
          warn_bg = '#303733',
          warn_fg = '#F0FFAA',
          info_fg = '#5B38E8',
          info_bg = '#281478',
          hint_fg = '#25E64B',
          hint_bg = '#147828',
        },
      }
      require('error-lens').setup(opts)

    -- local opts = {}
    if not g.darkmode then
      opts = {
        -- this setting tries to auto adjust the colors
        -- based on the diagnostic-highlight groups and your
        -- theme background color with a color blender
        enabled = false,
        -- auto_adjust = {
        --   enable = false,
        --   theme_bg = '#281478', -- mandatory if enable true (e.g. #281478)
        --   step = 5, -- inc: colors should be brighter/darker
        --   total = 30, -- steps of blender
        -- },
        prefix = 4, -- distance code <-> diagnostic message
        -- default colors
        colors = {
          error_fg = '#FF6363', -- diagnostic font color
          error_bg = '#4B252C', -- diagnostic line color
          warn_bg = '#303733',
          warn_fg = '#F0FFAA',
          info_fg = '#5B38E8',
          info_bg = '#281478',
          hint_fg = '#25E64B',
          hint_bg = '#147828',
        },
      }
      require('error-lens').setup(opts)
    else
      opts = {
        -- this setting tries to auto adjust the colors
        -- based on the diagnostic-highlight groups and your
        -- theme background color with a color blender
        enabled = true,
        auto_adjust = {
          enable = false,
          fallback_bg_color = nil, -- mandatory if enable true (e.g. #281478)
          step = 7, -- inc: colors should be brighter/darker
          total = 30, -- steps of blender
        },
        prefix = 4, -- distance code <-> diagnostic message
        -- default colors
        colors = {
          error_fg = '#4B252C', -- diagnostic font color
          error_bg = '#FF8b8b', -- diagnostic line color
          warn_fg = '#403733',
          warn_bg = '#F0FFAA',
          info_fg = '#6666cc',
          info_bg = '#381478',
          hint_fg = '#007700',
          hint_bg = '#99FF99',
        },
      }
      require('error-lens').setup(opts)
    end
  end,
}
