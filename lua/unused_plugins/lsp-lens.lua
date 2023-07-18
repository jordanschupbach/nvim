-- https://github.com/VidocqH/lsp-lens.nvim

return {
  'VidocqH/lsp-lens.nvim',
  config = function()
    require('lsp-lens').setup {
      enable = true,
      include_declaration = false, -- Reference include declaration
      sections = { -- Enable / Disable specific request
        definition = false,
        references = true,
        implementation = true,
      },
      ignore_filetype = {
        'prisma',
      },
    }
  end,
}
