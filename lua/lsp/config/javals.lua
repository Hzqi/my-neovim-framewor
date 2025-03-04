local lspconfig = require("lspconfig")

local opts = {
  cmd = {
    vim.fn.expand'$HOME/.local/share/nvim/mason/bin/jdtls',
    ('--jvm-arg=-javaagent:%s'):format(vim.fn.expand'$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar'),
    '--data',vim.fn.expand'$HOME/jdtls/workspace',
  },
  filetypes = { "java" },
  root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),
  settings = {
    java = {
      eclipse = {
        downloadSources = true
      },
      configuration = {
        updateBuildConfiguration = "interactive"
      },
      gradle = {
        enabled = true,
      },
      maven = {
        downloadSources = true
      },
      implementationsCodeLens = {
        enabled = true
      },
      referencesCodeLens = {
        enabled = true
      },
      references = {
        includeDecompiledSources = true
      },
      format = {
        enabled = true
      }
    },
    signatureHelp = {enabled = true},
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
  },
}

return {
  on_setup = function(server)
    --server:setup(opts)
    require('java').setup({
      jdk = {
        auto_install = false,
      },
    })
    lspconfig.jdtls.setup({})
  end,
}
