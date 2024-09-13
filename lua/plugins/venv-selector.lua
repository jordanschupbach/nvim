-- https://github.com/linux-cultist/venv-selector.nvim

return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python', --optional
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  lazy = false,
  branch = 'regexp', -- This is the regexp branch, use this for the new version
  config = function()
    require('venv-selector').setup {
      settings = {
        search = {
          my_venvs = {
            command = 'fd python$ ~/anaconda3/',
          },
        },
      },
    }
  end,
}

-- return {
--   'linux-cultist/venv-selector.nvim',
--
--   dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim' },
--   branch = ""
--   -- config = true,
--   config = function()
--     require('venv-selector').setup {
--       -- poetry_path = '~/.cache/pypoetry/virtualenvs/',
--       -- pipenv_path = "your_path_here",
--       -- pyenv_path = "your_path_here",
--       anaconda_path = '/home/jordan/anaconda3/envs/',
--       anaconda_base_path = '/home/anaconda3/',
--       -- anaconda_envs_path = '/home/cado/.conda/envs',
--     }
--   end,
--   event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
-- }
