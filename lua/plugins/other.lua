-- https://github.com/rgroli/other.nvim

return {
  'rgroli/other.nvim',
  config = function()
    require('other-nvim').setup {
      mappings = {
        {
          pattern = '/src/main/(.*)/(.*).java',
          target = '/src/test/%1/%2Test.java',
          -- transformer = 'lowercase',
          context = 'test',
        },
        {
          pattern = '/src/main/(.*)/(.*).java',
          target = '/../examples/src/main/java/edu/msu/sapphire/examples/%2Ex.java',
          -- transformer = 'lowercase',
          context = 'test',
        },
        -- {
        --   pattern = '/src/main/java/edu/msu/sapphire/(.*)/(.*).java',
        --   target = '/src/test/java/edu/msu/sapphire/%1/%2Test.java',
        --   -- transformer = 'lowercase',
        --   context = 'test',
        -- },
      },
      transformers = {
        -- defining a custom transformer
        lowercase = function(inputString)
          return inputString:lower()
        end,
      },
      style = {
        -- How the plugin paints its window borders
        -- Allowed values are none, single, double, rounded, solid and shadow
        border = 'solid',

        -- Column seperator for the window
        seperator = '|',

        -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
        width = 0.7,

        -- min height in rows.
        -- when more columns are needed this value is extended automatically
        minHeight = 2,
      },
    }
  end,
}
