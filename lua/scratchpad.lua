local M = {}

M.print_message = function()
  -- local function writeToBufferline(message)
  --   vim.api.nvim_command 'echohl None'
  --   vim.api.nvim_command("echo '" .. message .. "'")
  -- end

  -- -- Function to clear the bufferline
  -- local function clearBufferline()
  --   vim.api.nvim_command 'echohl None'
  --   vim.api.nvim_command "echo ''"
  -- end

  -- -- Example usage
  -- writeToBufferline("First message")
  -- vim.api.nvim_command("sleep 1000m")
  -- clearBufferline()
  -- writeToBufferline("Second message")
  -- Function to continuously write to the message bar
  local function writeToMessageBar(message)
    vim.api.nvim_command("echo '" .. message .. "'")
  end

  -- Example usage
  for i = 1, 10 do
    writeToMessageBar('Iteration ' .. i)
    -- writeToBufferline('Iteration ' .. i)
    -- print('Iteration ' .. i)
    vim.api.nvim_command 'sleep 100m'
    vim.api.nvim_command 'messages clear'
    vim.api.nvim_command '!clear'

    -- !clear
  end

  --- -- Function to wait for a specified number of milliseconds
  --- function wait(milliseconds)
  ---   local start = os.clock()
  ---   while os.clock() - start < milliseconds / 1000 do
  ---     -- Wait
  ---   end
  --- end
  --- -- Loop with a delay of 5 milliseconds
  --- for i = 1, 10 do
  ---   -- Do something
  ---   print('Pass:', i)

  ---   -- Wait for 5 milliseconds
  ---   wait(5)
  --- end

  --- print 'Hello World'
end

M.popup_hello = function()
  local Popup = require 'nui.popup'
  local event = require('nui.utils.autocmd').event

  local popup = Popup {
    enter = true,
    focusable = true,
    border = {
      style = 'rounded',
    },
    position = '50%',
    size = {
      width = '80%',
      height = '60%',
    },
  }

  -- mount/open the component
  popup:mount()

  -- unmount component when cursor leaves buffer
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)

  -- set content
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { 'Hello World' })
end

--- Function to get documentation for the word at cursor
M.get_documentation = function()
  local Popup = require 'nui.popup'
  local event = require('nui.utils.autocmd').event

  local popup = Popup {
    enter = true,
    focusable = true,
    border = {
      style = 'rounded',
    },
    position = '50%',
    size = {
      width = '80%',
      height = '60%',
    },
  }

  -- mount/open the component
  popup:mount()

  -- unmount component when cursor leaves buffer
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)

  -- set content
  local params = vim.lsp.util.make_position_params()
  local result = vim.lsp.buf_request_sync(vim.api.nvim_get_current_buf(), 'textDocument/hover', params, 1000)

  if result then
    print 'Got a result!'
  end

  if not result or not result[1] then
    print 'No information available'
    return
  end

  local contents = result[1].result.contents
  if contents then
    print 'Also got contents'
  end
  if contents then
    if type(contents) == 'table' then
      print 'contents was a table'
      local markup_content = {}
      for _, part in ipairs(contents) do
        table.insert(markup_content, part.value)
      end
      print(table.concat(markup_content, '\n'))
      vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { table.concat(markup_content, '\n') })
    elseif type(contents) == 'string' then
      print 'contents was a string'
      print(contents)
      vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { contents })
    end
  else
    print 'No information available'
    -- vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { 'No information available' })
  end
end

return M
