-- https://github.com/sQVe/sort.nvim

return {
  'sQVe/sort.nvim',

  -- Optional setup for overriding defaults.
  config = function()
    require('sort').setup {
      -- List of delimiters, in descending order of priority, to automatically
      -- sort on.
      delimiters = {
        ',',
        '|',
        ';',
        ':',
        's', -- Space
        't', -- Tab
      },
    }
  end,
}
