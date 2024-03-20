local bundles = {
  vim.fn.glob '/home/jordan/git_repos/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
}

vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob('/home/jordan/.vscode-oss/extensions/vscjava.vscode-java-test-0.39.1-universal/server/*.jar', 1),
    '\n'
  )
)

local function setup()
  local pkg_status, jdtls = pcall(require, 'jdtls')
  if not pkg_status then
    vim.notify('unable to load nvim-jdtls', 'error')
    return {}
  end

  local opts = {
    init_options = {
      bundles = bundles,
    },
    cmd = {},
    settings = {
      java = {

        single_file_support = true,
        signatureHelp = { enabled = true },
        completion = {
          favoriteStaticMembers = {},
          filteredTypes = {
            -- "com.sun.*",
            -- "io.micrometer.shaded.*",
            -- "java.awt.*",
            -- "jdk.*",
            -- "sun.*",
          },
        },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
        codeGeneration = {
          toString = {
            template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
          },
          useBlocks = true,
        },
        configuration = {
          runtimes = {
            {
              name = 'JavaSE-1.8',
              path = '/usr/lib/jvm/java-8-openjdk/',
              -- path = "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home",
              -- default = true,
            },
            {
              name = 'JavaSE-17',
              path = '/usr/lib/jvm/java-17-openjdk/',
              -- path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
            },
            {
              name = 'JavaSE-18',
              path = '/usr/lib/jvm/java-18-openjdk/',
              -- path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
              default = true,
            },
            {
              name = 'JavaSE-21',
              path = '/usr/lib/jvm/java-21-openjdk/',
              -- path = "/Library/Java/JavaVirtualMachines/jdk-19.jdk/Contents/Home",
            },
          },
        },
      },
    },
  }

  opts['on_attach'] = function(client, bufnr)
    -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    require('jdtls').setup_dap { hotcodereplace = 'auto' }
  end

  -- local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
  -- local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
  local jdtls_bin = '/usr/bin/jdtls'
  --   print(vim.fn.stdpath("data"))

  -- local jdtls_bin = "/usr/bin/jdtls"

  -- local root_markers = { ".gradle", "gradlew", ".git" }
  local root_markers = { 'gradlew', '.git' }
  local root_dir = jdtls.setup.find_root(root_markers)
  local home = os.getenv 'HOME'
  local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
  local workspace_dir = home .. '/.cache/jdtls/workspace/' .. project_name

  opts.cmd = {
    jdtls_bin,
    '-configuration /home/jordan/.cache/jdtls/config',
    '-data',
    workspace_dir,
  }

  local on_attach = function(_, _)
    require('jdtls').setup_dap { hotcodereplace = 'auto' }
    -- require('dap.ext.vscode').load_launchjs()
    -- jdtls.dap.setup_dap_main_class_configs()

    -- you may want to also run your generic on_attach() function used by your LSP config
  end
  opts.on_attach = on_attach
  -- opts.capabilities = vim.lsp.protocol.make_client_capabilities()

  opts.capabilities = require('cmp_nvim_lsp').default_capabilities()

  return opts
end

return { setup = setup }
