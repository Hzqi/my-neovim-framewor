local lsp = require("lspconfig")

-- 设置JDTLS的路径
local function get_jdtls_workspace()
  local workspace_dir = '~/Desktop/NeovimAny/jdtls/'
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  return workspace_dir .. project_name
end

local opts = {
  settings = {
    cmd = {
      '~/.local/share/nvim/mason/packages/jdtls/bin/jdtls',
      '-data', '~/Desktop/NeovimAny/jdtls/'  --get_jdtls_workspace()
    },
    root_dir = lsp.util.root_pattern('.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'),
    settings = {
      java = {
        eclipse = {
          downloadSources = true
        },
        configuration = {
          updateBuildConfiguration = "interactive"
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
      }
    }
  },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- 绑定快捷键
    require('keybindings').mapLSP(buf_set_keymap)
  end,
}

return {
  on_setup = function(server)
    server:setup(opts)
  end,
}

