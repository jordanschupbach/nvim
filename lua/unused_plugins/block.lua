return {
  'HampusHauffman/block.nvim',
  dependencies = { 'chikko80/error-lens.nvim' },
  config = function()
    require('block').setup {
      percent = 0.8,
      depth = 10,
      -- colors = nil,
      automatic = false,
      bg = nil,
      -- colors = {
      --   "#111111",
      --   "#222222",
      --   "#333333",
      --   "#444444",
      --   "#555555",
      -- }

      colors = {
        '#ffffff',
        '#eeeeee',
        '#dddddd',
        '#cccccc',
        '#bbbbbb',
        '#aaaaaa',
        '#999999',
        '#888888',
        '#777777',
        '#666666',
      },
    }
  end,
}
