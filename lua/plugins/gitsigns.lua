return {
  'lewis6991/gitsigns.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    require('gitsigns').setup {
      sign_priority = 1,
      signs = {
        add = { text = '▍' },
        change = { text = '▍' },
        delete = { text = '▍' },
        topdelete = { text = '▍' },
        changedelete = { text = '▍' },
      },
    }
  end,
}
