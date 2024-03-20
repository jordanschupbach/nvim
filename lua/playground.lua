local utils = require 'utilities'

-- local m = require('mapx').setup { global = true, whichkey = true }

utils.dump(utils.extract_paragraph_at_cursor)

SAY_HELLO = function()
  utils.run_lua_paragraph()
end

vim.api.nvim_create_user_command('PopupParagraphAtPoint', function()
  local text = utils.runRScript "print('hello world')"
  utils.show_simple_popup(text)
end, {
  desc = 'Show selected text in a popup',
})

vim.api.nvim_create_user_command('RunCurrentCPPFile', function()
  local temp_file1 = vim.fn.tempname()
  local current_filepath = utils.getCurrentBufferFilePath()
  local current_filename = utils.extractFilename(current_filepath)
  local runpath = vim.fn.getcwd() .. '/build/default/examples/' .. current_filename
  local command = runpath .. ' > ' .. temp_file1
  local output = vim.fn.system(command)
  local output_text = utils.readFromFile2(temp_file1)
  utils.show_simple_popup(output_text)
  print(utils.extractFilename(current_filepath))
end, {
  desc = 'Show selected text in a popup',
})

currentDirectory = vim.fn.getcwd()

print(currentDirectory)

vim.api.nvim_create_user_command('RunLuaParagraphAtPoint', function()
  utils.run_lua_paragraph()
end, {
  desc = 'Show selected text in a popup',
})

vim.keymap.set({ 'n' }, '<C-g>', function()
  local utils = require 'utilities'
  utils.run_lua_paragraph()
end, { silent = true, noremap = true, desc = 'toggle signature' })

-- NOTE: This seems close below....

-- _G.MyGlobalCount = 0

-- local function sayHelloWorld()
--   MyGlobalCount = MyGlobalCount + 1
--   print("Hello, world! Count:", MyGlobalCount)
-- end

-- _G.sayHelloWorld = function()
--   MyGlobalCount = MyGlobalCount + 1
--   print("Hello, world! Count:", _G.MyGlobalCount)
-- end
--
--
-- _G.onIdle = function ()
--   local currentWin = vim.api.nvim_get_current_win()
--   local cursorPos = vim.api.nvim_win_get_cursor(currentWin)
--   local lastCursorPos = vim.g.lastCursorPos or {}
--
--   -- Check if the cursor position has changed
--   if cursorPos[1] ~= lastCursorPos[1] or cursorPos[2] ~= lastCursorPos[2] then
--     -- Update the last cursor position
--     vim.g.lastCursorPos = {cursorPos[1], cursorPos[2]}
--     vim.fn.timer_start(5000, function()
--       local newCursorPos = vim.api.nvim_win_get_cursor(currentWin)
--       if newCursorPos[1] == cursorPos[1] and newCursorPos[2] == cursorPos[2] then
--         -- sayHelloWorld()
--         require('lsp_signature').toggle_float_win()
--       end
--     end)
--   end
-- end
--
--
-- vim.api.nvim_command('autocmd CursorMoved * lua _G.onIdle()')

-- vim.api.nvim_command('autocmd CursorMoved * lua onIdle()')
-- onIdle()

-- vim.cmd("command! Idle lua onIdle()")
