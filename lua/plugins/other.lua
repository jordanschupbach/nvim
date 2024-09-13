-- https://github.com/rgroli/other.nvim

return {
  'rgroli/other.nvim',
  config = function()
    require('other-nvim').setup {
      mappings = {
        -- {{{ java
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

        -- }}} java

        -- {{{ hpp
        {
          pattern = '/include/(.*)/(.*).hpp',
          target = '/tests/%2_tests.cpp',
          -- transformer = 'lowercase',
          context = 'test',
        },

        {
          pattern = '/include/(.*)/(.*).hpp',
          target = '/examples/%2_example.cpp',
          -- transformer = 'lowercase',
          context = 'example',
        },

        {
          pattern = '/include/(.*)/(.*).hpp',
          target = '/src/%2.cpp',
          -- transformer = 'lowercase',
          context = 'example',
        },
        -- }}} hpp

        -- {{{ cpp

        -- {
        --   pattern = '/src/(.*)/(.*).cpp',
        --   target = '/test/%2_tests.cpp',
        --   -- transformer = 'lowercase',
        --   context = 'test',
        -- },

        {
          pattern = '/src/(.*).cpp',
          target = '/tests/%1_tests.cpp',
          -- transformer = 'lowercase',
          context = 'tests',
        },

        {
          pattern = '/include/(.*).hpp',
          target = {
            {
              target = '/src/%1.cpp', -- Include
              context = 'src',
            },
            {
              target = '/tests/%1_tests.cpp', -- Test
              context = 'tests',
            },
            {
              target = '/examples/%1_example.cpp', -- Example
              context = 'example',
            },
          },
        },

        {
          pattern = '/src/(.*).cpp',
          target = {
            {
              target = '/include/%1.hpp', -- Include
              context = 'include',
            },
            {
              target = '/tests/%1_tests.cpp', -- Test
              context = 'tests',
            },
            {
              target = '/examples/%1_example.cpp', -- Example
              context = 'example',
            },
          },
        },

        {
          pattern = '/examples/(.*).cpp',
          target = {

            {
              target = '/src/%1.cpp',
              context = 'src',
              transformer = 'remove_example',
            },

            {
              target = '/tests/%1_tests.cpp',
              context = 'tests',
              transformer = 'remove_example',
            },

            {
              target = '/include/%1.hpp',
              context = 'include',
              transformer = 'remove_example',
            },
          },
          transformers = 'remove_example',
        },

        -- {{{ old
        -- { --
        --   pattern = '/tests/(.*).cpp',
        --   target = {
        --     {
        --       target = '/src/%1.cpp',
        --       context = 'src',
        --       transformer = 'remove_example',
        --     },

        --     {
        --       target = '/include/%1_tests.cpp',
        --       context = 'tests',
        --       transformer = 'remove_example',
        --     },

        --     {
        --       target = '/include/%1.hpp',
        --       context = 'include',
        --       transformer = 'remove_example',
        --     },
        --   },
        --   transformers = 'remove_example',
        -- },

        -- {
        --   pattern = '/src/(.*)/(.*).cpp',
        --   target = '/src/%2.cpp',
        --   -- transformer = 'lowercase',
        --   context = 'example',
        -- },

        -- { -- NOTE: this doesn't seem needed
        --   pattern = '/src/(.*).cpp',
        --   target = '/src/%1.cpp',
        --   -- transformer = 'lowercase',
        --   context = 'test',
        -- },
        --
        -- }}} old
      },
      transformers = {
        -- defining a custom transformer
        lowercase = function(inputString)
          return inputString:lower()
        end,

        remove_example = function(inputString)
          return inputString:gsub('_example', '')
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
        minHeight = 5,
      },
    }
  end,
}
