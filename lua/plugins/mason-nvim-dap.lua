-- https://github.com/jay-babu/mason-nvim-dap.nvim
return {
  'jay-babu/mason-nvim-dap.nvim',
  after = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' },
  config = function()
    require('mason-nvim-dap').setup {
      ensure_installed = { 'python', 'cppdbg' },
      handlers = {
        function(config)
          -- all sources with no handler get passed here

          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
        python = function(config)
          config.adapters = {
            type = 'executable',
            command = '/usr/bin/python3',
            args = {
              '-m',
              'debugpy.adapter',
            },
          }
          require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
      },
    }
  end,
}
