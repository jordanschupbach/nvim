-- https://github.com/roobert/action-hints.nvim

return {
  'roobert/action-hints.nvim',
  config = function()
    require('action-hints').setup {
      template = {
        { ' ⊛', 'ActionHintsDefinition' },
        { ' ↱%s', 'ActionHintsReferences' },
      },
      use_virtual_text = true,
      definition_color = '#add8e6',
      reference_color = '#ff6666',
    }
  end,
}
