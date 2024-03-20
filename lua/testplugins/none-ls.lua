-- https://github.com/nvimtools/none-ls.nvim

return {
  'nvimtools/none-ls.nvim', -- Formatting engine
  dependencies = { 'lewis6991/gitsigns.nvim', 'davidmh/cspell.nvim' },
  ft = { 'cpp', 'java', 'lua', 'r', 'python', 'markdown', 'zig' },
  config = function()
    local cspell = require 'cspell'
    local none_ls = require 'null-ls'
    local cpplint = none_ls.builtins.diagnostics.cpplint
    cpplint['args'] = { '$FILENAME', '--linelength', '120' }
    require('null-ls').setup {
      sources = {
        -- none_ls.builtins.diagnostics.cspell,
        -- none_ls.builtins.code_actions.cspell,
        none_ls.builtins.diagnostics.chktex,
        none_ls.builtins.code_actions.gitsigns,

        -- cspell.diagnostics,
        -- cspell.code_actions,

        --none_ls.builtins.code_actions.ltrs,
        none_ls.builtins.code_actions.refactoring,
        none_ls.builtins.code_actions.shellcheck,
        -- none_ls.builtins.diagnostics.clang_check, -- NOTE: seems to have false pos. b/c of version mismatch?
        -- none_ls.builtins.diagnostics.clang_format, -- NOTE: seems to have false pos. b/c of version mismatch?
        none_ls.builtins.diagnostics.cmake_lint,
        -- none_ls.builtins.diagnostics.codespell,
        none_ls.builtins.diagnostics.commitlint,
        none_ls.builtins.diagnostics.cppcheck,
        -- none_ls.builtins.diagnostics.checkstyle.with({
        --     extra_args = { "-c", "/home/jordan/.config/nvim/resources/checkstyle.xml" }, -- or "/sun_checks.xml" or path to self written rules
        -- }),
        none_ls.builtins.diagnostics.checkstyle.with {
          -- args = { "-f", "sarif", vim.api.nvim_buf_get_name(0), "-c", "/home/jordan/work/navy/JSAPPHIRE/config/checkstyle/checkstyle.xml" },
          -- args = { "-f", "sarif", "/home/jordan/work/navy/JSAPPHIRE/subprojects/reasonerxmlio/*", "-c", "/home/jordan/work/navy/JSAPPHIRE/config/checkstyle/checkstyle.xml" },
          args = {
            '-f',
            'sarif',
            '/home/jordan/git_repos/reu2023/*',
            '-c',
            '/home/jordan/git_repos/reu2023/config/checkstyle/checkstyle.xml',
          },
          -- args = { '-f', 'sarif', '/home/jordan/work/navy/JSAPPHIRE/charm/*', '-c', '/home/jordan/git_repos/reu2023/config/checkstyle/checkstyle.xml', },
          -- args = { "-f", "sarif", "/home/jordan/templates/jtemplate/*", "-c", "/home/jordan/work/navy/JSAPPHIRE/config/checkstyle/checkstyle.xml" },
          -- args = { "-f", "sarif", ".", "-c", "/home/jordan/work/navy/JSAPPHIRE/config/checkstyle/checkstyle.xml" },
        },
        -- none_ls.builtins.diagnostics.cpplint,
        -- cpplint,
        -- none_ls.builtins.diagnostics.cspell,
        none_ls.builtins.diagnostics.editorconfig_checker,
        none_ls.builtins.diagnostics.flake8,
        -- none_ls.builtins.diagnostics.markdownlint,
        -- none_ls.builtins.diagnostics.markdownlint.with({
        --     method = none_ls.methods.DIAGNOSTICS_ON_SAVE,
        -- }),
        -- none_ls.builtins.diagnostics.misspell,
        none_ls.builtins.diagnostics.mypy,
        -- none_ls.builtins.diagnostics.proselint,
        none_ls.builtins.diagnostics.pydocstyle,
        none_ls.builtins.diagnostics.pycodestyle,
        none_ls.builtins.diagnostics.rstcheck,
        none_ls.builtins.diagnostics.selene,
        none_ls.builtins.diagnostics.shellcheck,
        -- none_ls.builtins.diagnostics.vale,
        -- none_ls.builtins.diagnostics.vulture,
        none_ls.builtins.formatting.beautysh,
        none_ls.builtins.formatting.bibclean,
        none_ls.builtins.hover.dictionary,
        require('null-ls').builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.completion.spell,
      },
    }
  end,
}
