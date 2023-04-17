return {
  'ray-x/lsp_signature.nvim',
  config = function()
    local cfg = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = 'rounded',
      },
    }

    require('lsp_signature').setup(cfg)
  end,
}
