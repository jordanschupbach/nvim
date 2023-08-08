-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main

return {
  'jose-elias-alvarez/null-ls.nvim', -- Formatting engine
  dependencies = { 'lewis6991/gitsigns.nvim' },
  ft = { 'cpp', 'java', 'lua', 'r', 'python', 'markdown', 'zig' },
  config = function()
    local null_ls = require 'null-ls'
    local cpplint = null_ls.builtins.diagnostics.cpplint
    cpplint['args'] = { '$FILENAME', '--linelength', '120' }
    require('null-ls').setup {
      sources = {
        -- null_ls.builtins.diagnostics.cspell,
        -- null_ls.builtins.code_actions.cspell,
        null_ls.builtins.diagnostics.chktex,
        null_ls.builtins.code_actions.gitsigns,
        --null_ls.builtins.code_actions.ltrs,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.diagnostics.clang_check,
        null_ls.builtins.diagnostics.cmake_lint,
        -- null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.commitlint,
        null_ls.builtins.diagnostics.cppcheck,
        -- null_ls.builtins.diagnostics.checkstyle.with({
        --     extra_args = { "-c", "/home/jordan/.config/nvim/resources/checkstyle.xml" }, -- or "/sun_checks.xml" or path to self written rules
        -- }),
        null_ls.builtins.diagnostics.checkstyle.with {
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
        -- null_ls.builtins.diagnostics.cpplint,
        cpplint,
        -- null_ls.builtins.diagnostics.cspell,
        null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.diagnostics.flake8,
        -- null_ls.builtins.diagnostics.markdownlint,
        -- null_ls.builtins.diagnostics.markdownlint.with({
        --     method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        -- }),
        -- null_ls.builtins.diagnostics.misspell,
        null_ls.builtins.diagnostics.mypy,
        -- null_ls.builtins.diagnostics.proselint,
        null_ls.builtins.diagnostics.pydocstyle,
        null_ls.builtins.diagnostics.pycodestyle,
        null_ls.builtins.diagnostics.rstcheck,
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.diagnostics.shellcheck,
        -- null_ls.builtins.diagnostics.vale,
        -- null_ls.builtins.diagnostics.vulture,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.bibclean,
        null_ls.builtins.hover.dictionary,
        require('null-ls').builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.completion.spell,
      },
    }
  end,
}
