local util = require 'vim.lsp.util'

local M = {}

local docBufferHandle = 0

-- shows doc in a buffer below
M.hover = function()
  vim.lsp.buf_request(0, 'textDocument/hover', util.make_position_params(), function(_, result, ctx, config)
    config = config or {}
    config.focus_id = ctx.method
    if not (result and result.contents) then
      -- return { 'No information available' }
      return
    end
    local markdown_lines = util.convert_input_to_markdown_lines(result.contents)
    -- trims beg and end of whole content
    markdown_lines = util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      return
    end

    -- print(dump(markdown_lines))

    -- nvim.fn.bufexists("asdf")
    -- print("Hello" .. name)
    local doc_buf_exists = (vim.fn.bufexists("myDoc") == 1)
    if not doc_buf_exists then
      vim.api.nvim_command [[ vsplit myDoc ]]
      docBufferHandle = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_lines(0, 0, 1, false, markdown_lines)
      vim.api.nvim_command [[ setlocal ft=markdown ]]
      vim.api.nvim_command [[ nnoremap <buffer>q <C-W>c ]]
      vim.api.nvim_command [[ setlocal buftype+=nofile ]]
      vim.api.nvim_command [[ setlocal nobl ]]
      vim.api.nvim_command [[ setlocal conceallevel=2 ]]
      vim.api.nvim_command [[ setlocal concealcursor+=n ]]
    else
      -- check if buffer is currently in window
      -- check if doc buffer is already visible
      local IsDocBufferVisible = false
      local DocWindowHandle = 0
      local wins = vim.api.nvim_list_wins()
      for _, v in pairs(wins) do
        local buf = vim.api.nvim_win_get_buf(v)
        if buf == docBufferHandle then
          IsDocBufferVisible = true
          DocWindowHandle = v
        end
      end
      if IsDocBufferVisible then
        vim.api.nvim_set_current_win(DocWindowHandle)
        vim.api.nvim_command [[ goto 1 ]]
        vim.api.nvim_command [[ 1,$d ]]
        vim.api.nvim_buf_set_lines(0, 0, 1, false, markdown_lines)
        -- TODO: handle case when doc buffer isn't visible
      end

      -- vim.api.nvim_command [[ b myDoc ]]
      -- vim.api.nvim_buf_set_lines(0, 0, 1, false, markdown_lines)
      -- vim.api.nvim_command [[ setlocal ft=markdown ]]
      -- vim.api.nvim_command [[ nnoremap <buffer>q <C-W>c ]]
      -- vim.api.nvim_command [[ setlocal buftype+=nofile ]]
      -- vim.api.nvim_command [[ setlocal nobl ]]
      -- vim.api.nvim_command [[ setlocal conceallevel=2 ]]
      -- vim.api.nvim_command [[ setlocal concealcursor+=n ]]
    end

    -- handle else case....

    -- vim.api.nvim_command( [[ b myDoc ]] )
    -- -- vim.api.nvim_command [[ new myDoc]]
    -- -- vim.api.nvim_command [[ vsplit doc ]]
    -- vim.api.nvim_buf_set_lines(0, 0, 1, false, markdown_lines)
    -- vim.api.nvim_command [[ setlocal ft=markdown ]]
    -- vim.api.nvim_command [[ nnoremap <buffer>q <C-W>c ]]
    -- vim.api.nvim_command [[ setlocal buftype+=nofile ]]
    -- vim.api.nvim_command [[ setlocal nobl ]]
    -- vim.api.nvim_command [[ setlocal conceallevel=2 ]]
    -- vim.api.nvim_command [[ setlocal concealcursor+=n ]]
    -- -- vim.api.nvim_command [[ setlocal ft=lsp_markdown ]]
  end)
end
return M
