-- https://github.com/linux-cultist/venv-selector.nvim

return {
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim' },
  -- config = true,
  config = function()
    require('venv-selector').setup {
      poetry_path = '~/.cache/pypoetry/virtualenvs/',
      -- pipenv_path = "your_path_here",
      -- pyenv_path = "your_path_here",
      anaconda_path = '~/.conda/envs/',
    }
  end,
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
}
