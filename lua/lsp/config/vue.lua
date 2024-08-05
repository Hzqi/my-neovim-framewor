local lsp = require("lspconfig")

local opts = {
  settings = {
    filetypes = {"vue", "yjpl", "javascript", "typescript"},
    settings = {
      vetur = {
        useWorkspaceDependencies = true,
        validation = {
          template = true,
          script = true,
          style = true,
          templateProps = true,
          interpolation = true,
        },
        format = {
          defaultFormatter = {
            ts = "prettier",
            js = "prettier",
          },
        },
      },
    },
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
