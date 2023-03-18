return {
  'jose-elias-alvarez/null-ls.nvim', -- Formatting engine
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
        null_ls.builtins.code_actions.ltrs,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.diagnostics.clang_check,
        null_ls.builtins.diagnostics.cmake_lint,
        -- null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.commitlint,
        null_ls.builtins.diagnostics.cppcheck,
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
