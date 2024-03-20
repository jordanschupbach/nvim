-- local ucpp = require'utils.cpputils'

local utils = require 'utilities'

vim.api.nvim_create_user_command('RunCurrentCPPFile', function()
  local temp_file1 = vim.fn.tempname()
  local current_filepath = utils.getCurrentBufferFilePath()
  local current_filename = utils.extractFilename(current_filepath)
  local executable_name = current_filename:gsub('%..-$', '')
  local runpath = vim.fn.getcwd() .. '/build/default/examples/' .. executable_name
  local command = runpath .. ' > ' .. temp_file1
  vim.fn.system(command)
  local output_text = utils.readFromFile2(temp_file1)
  utils.show_simple_popup(output_text)
  -- print(runpath)
end, {
  desc = 'Show selected text in a popup',
})

vim.api.nvim_create_user_command('PerfCurrentCPPFile', function()
  local temp_file1 = vim.fn.tempname()
  local current_filepath = utils.getCurrentBufferFilePath()
  local current_filename = utils.extractFilename(current_filepath)
  local executable_name = current_filename:gsub('%..-$', '') -- remove extension
  local runpath = vim.fn.getcwd() .. '/build/default/examples/' .. executable_name

  -- now construct gprof or callgrind or perf...
  --perf script report flamegraph

  local record
  command1 = 'perf record -F 99 -a -g  -o ./build/ -- ' .. runpath
  local record
  command2 = 'perf script ' .. runpath
  vim.fn.system(command1)
  local output_text = utils.readFromFile2(temp_file1)
  utils.show_simple_popup(output_text)
  -- print(runpath)
end, {
  desc = 'Show selected text in a popup',
})

-- Currently, there seems to be some issuse with cmake-tools. It seems files are already open somehow, and this
-- prevents me from getting c++ mode being set and  from saving to the file.

-- -- NOTE: this should probably go somewhere else?
--
-- require('cmake-tools').setup {
--   cmake_command = 'cmake', -- this is used to specify cmake command path
--   cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
--   cmake_generate_options = { '-DCMAKE_EXPORT_COMPILE_COMMANDS=1' }, -- this will be passed when invoke `CMakeGenerate`
--   cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
--   cmake_build_directory = 'build', -- this is used to specify generate directory for cmake
--   cmake_build_directory_prefix = 'cmake_build_', -- when cmake_build_directory is set to "", this option will be activated
--   cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
--   cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
--   cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
--   cmake_variants_message = {
--     short = { show = true }, -- whether to show short message
--     long = { show = true, max_length = 40 }, -- whether to show long message
--   },
--   cmake_dap_configuration = { -- debug settings for cmake
--     name = 'cpp',
--     type = 'lldb',
--     request = 'launch',
--     stopOnEntry = false,
--     runInTerminal = true,
--     console = 'integratedTerminal',
--   },
--   cmake_always_use_terminal = false, -- if true, use terminal for generate, build, clean, install, run, etc, except for debug, else only use terminal for run, use quickfix for others
--   cmake_quickfix_opts = { -- quickfix settings for cmake, quickfix will be used when `cmake_always_use_terminal` is false
--     show = 'always', -- "always", "only_on_error"
--     position = 'belowright', -- "bottom", "top"
--     size = 10,
--   },
--   cmake_terminal_opts = { -- terminal settings for cmake, terminal will be used for run when `cmake_always_use_terminal` is false or true, will be used for all tasks except for debug when `cmake_always_use_terminal` is true
--     name = 'Main Terminal',
--     prefix_name = '[CMakeTools]: ', -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
--     split_direction = 'horizontal', -- "horizontal", "vertical"
--     split_size = 11,
--
--     -- Window handling
--     single_terminal_per_instance = true, -- Single viewport, multiple windows
--     single_terminal_per_tab = true, -- Single viewport per tab
--     keep_terminal_static_location = true, -- Static location of the viewport if available
--
--     -- Running Tasks
--     start_insert_in_launch_task = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
--     start_insert_in_other_tasks = false, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
--     focus_on_main_terminal = false, -- Focus on cmake terminal when cmake task is launched. Only used if cmake_always_use_terminal is true.
--   },
-- }
