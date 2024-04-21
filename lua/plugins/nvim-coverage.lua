-- https://github.com/andythigpen/nvim-coverage

return {
  'andythigpen/nvim-coverage',
  requires = 'nvim-lua/plenary.nvim',
  -- Optional: needed for PHP when using the cobertura parser
  rocks = { 'lua-xmlreader' },
  config = function()
    require('coverage').setup {
      -- commands = true, -- create commands
      -- -- highlights = {
      -- --   -- -- customize highlight groups created by the plugin
      -- --   -- covered = { fg = '#C3E88D' }, -- supports style, fg, bg, sp (see :h highlight-gui)
      -- --   -- uncovered = { fg = '#F07178' },
      -- --   -- partial = { fg = '#AA71F0' },
      -- -- },

      -- signs = {
      --   covered = { hl = 'CoverageCovered', text = '█' },
      --   uncovered = { hl = 'CoverageCovered', text = '█' },
      --   partial = { hl = 'CoverageCovered', text = '█' },
      --   -- ▎-- customize signs
      -- },
    }
  end,
}
