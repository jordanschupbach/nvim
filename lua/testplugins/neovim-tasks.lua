-- https://github.com/Shatur/neovim-tasks

return {
  'Shatur/neovim-tasks',
  config = function()
    require('tasks').setup {
      default_params = { -- Default module parameters with which `neovim.json` will be created.
        cmake = {
          cmd = 'cmake', -- CMake executable to use, can be changed using `:Task set_module_param cmake cmd`.
          cwd = '/home/jordan/git_repos/jaspp',
          os = 'linux',
          -- 'linux-debug/'
          build_dir = tostring('/home/jordan/git_repos/jaspp/' .. 'build/'), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
          build_type = 'Debug', -- Build type, can be changed using `:Task set_module_param cmake build_type`.
          dap_name = 'lldb', -- DAP configuration name from `require('dap').configurations`. If there is no such configuration, a new one with this name as `type` will be created.
          args = { -- Task default arguments.
            configure = {
              '-G',
              'Ninja',
              '-B',
              './build',
              '-S',
              '.',
              '-D',
              'CMAKE_BUILD_TYPE=RelWithDebInfo',
              '-D',
              'CMAKE_TOOLCHAIN_FILE=./vcpkg/scripts/buildsystems/vcpkg.cmake',
              '-D',
              'CMAKE_EXPORT_COMPILE_COMMANDS=1',
            },
            -- cmake -G Ninja -B ./build/ -S . -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_TOOLCHAIN_FILE=./vcpkg/scripts/buildsystems/vcpkg.cmake
          },
        },
      },
      save_before_run = true, -- If true, all files will be saved before executing a task.
      params_file = 'neovim.json', -- JSON file to store module and task parameters.
      quickfix = {
        pos = 'botright', -- Default quickfix position.
        height = 12, -- Default height.
      },
      dap_open_command = function()
        return require('dap').repl.open()
      end, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
    }
  end,
}
