local lsp = require("lspconfig")
local jdtls_ok, jdtls = pcall(require, "jdtls")

-- 设置JDTLS的路径
local function get_jdtls_workspace()
  local workspace_dir = '~/jdtls/'
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  return workspace_dir .. project_name
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local opts = {
  --settings = {
  cmd = {
    vim.fn.expand'$HOME/.local/share/nvim/mason/bin/jdtls',
    ('--jvm-arg=-javaagent:%s'):format(vim.fn.expand'$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar'),
    '--data',vim.fn.expand'$HOME/jdtls/workspace',
  },
  --[[cmd = {
    '/usr/lib/jvm/java-17-openjdk-amd64/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- lombok
    '-javaagent:/home/jacky/lombok/lombok.jar',
    '-Xbootclasspath/a:/home/jacky/lombok/lombok.jar',

    '-jar',
    '/home/jacky/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
    '-configuration',
    '/home/jacky/.local/share/nvim/mason/packages/jdtls/config_linux',

    '-data',
    '/home/jacky/jdtls'
  },]]--
  --root_dir = lsp.util.root_pattern('.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'),
  root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),
  --root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' })[1]),
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
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
  },
  --},
  on_attach = function(client, bufnr)
    --client.resolved_capabilities.document_formatting = false
    --client.resolved_capabilities.document_range_formatting = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- 绑定快捷键
    require('keybindings').mapLSP(buf_set_keymap)
    print("JDTLS attached!")
    --vim.lsp.buf_attach_client(bufnr, client)
  end,
}

return {
  on_setup = function(server)
    --server:setup(opts)
    lsp.jdtls.setup(opts)
  end,
}

