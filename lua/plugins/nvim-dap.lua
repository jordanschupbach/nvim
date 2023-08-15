-- https://github.com/mfussenegger/nvim-dap

return {
  'mfussenegger/nvim-dap',
  dependencies = 'mfussenegger/nvim-jdtls',
  config = function()
    local dap = require 'dap'

    -- dap.adapters.lldb = {
    --   type = 'executable',
    --   attach = { pidProperty = "pid", pidSelect = "ask" },
    --   command = 'lldb-vscode',
    --   name = "lldb",
    --   env = { LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES" }
    -- }

    -- dap.adapters.codelldb = {
    --   type = 'server',
    --   port = "1300",
    --   executable = {
    --     -- CHANGE THIS to your path!
    --     command = '/home/jordan/Downloads/codelldb/extension/adapter/codelldb',
    --     args = {"--port", "1300"},
    --
    --     -- On windows you may have to uncomment this:
    --     -- detached = false,
    --   }
    -- }
    -- dap.configurations.cpp = {
    --   {
    --     name = "Launch file",
    --     type = "codelldb",
    --     request = "launch",
    --     program = function()
    --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    --     end,
    --     cwd = '${workspaceFolder}',
    --     stopOnEntry = false,
    --   },
    -- }

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/jordan/Downloads/extension/debugAdapters/bin/OpenDebugAD7',
    }

    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'cppdbg',
        request = 'launch',
        program = function()
          return vim.fn.input { 'Path to executable: ', vim.fn.getcwd() .. '/', 'file' }
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
          return vim.fn.input { 'Path to executable: ', vim.fn.getcwd() .. '/', 'file' }
        end,
      },
    }

    -- dap.configurations.java = {
    --   {
    --     type = 'java',
    --     request = 'attach',
    --     name = "Debug (Attach) - Remote",
    --     hostName = "127.0.0.1",
    --     port = 5005,
    --   },
    -- }

    -- dap.adapters.java = function(callback)
    --   -- fixme:
    --   -- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command
    --   -- The response to the command must be the `port` used below
    --   callback({
    --     type = 'server',
    --     host = '127.0.0.1',
    --     port = 5005,
    --   })
    -- end

    dap.adapters.python = function(cb, config)
      if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb {
          type = 'server',
          port = assert(port, '`connect.port` is required for a python `attach` configuration'),
          host = host,
          options = {
            source_filetype = 'python',
          },
        }
      else
        cb {
          type = 'executable',
          command = '/usr/bin/python',
          args = { '-m', 'debugpy.adapter' },
          options = {
            source_filetype = 'python',
          },
        }
      end
    end

    dap.configurations.python = {
      {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = 'Launch file',

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = '${file}', -- This configuration will launch the current file if used.
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end,
      },
    }

    -- dap.configurations.cpp = {
    --   {
    --     name = "Launch",
    --     type = "lldb",
    --     request = "launch",
    --     program = function()
    --       return vim.fn.input(vim.fn.getcwd() .. '/')
    --     end,
    --     cwd = '${workspaceFolder}',
    --     stopOnEntry = false,
    --     args = {},

    --     -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --     --
    --     --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --     --
    --     -- Otherwise you might get the following error:
    --     --
    --     --    Error on launch: Failed to attach to the target process
    --     --
    --     -- But you should be aware of the implications:
    --     -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    --     runInTerminal = false
    --   }
    -- }

    -- dap.configurations.c = dap.configurations.cpp
    -- dap.configurations.rust = dap.configurations.cpp
  end,
}
