local lsp = require("lspconfig")

local opts = {
  settings = {
    cmd = { "clojure-lsp" },
    filetypes = { "clojure", "clojurescript", "edn" },
    root_dir = lsp.util.root_pattern("project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"),
  },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.document_range_formatting = true
    local function buf_set_keymap( ...)
      vim.api.nvim_buf_set_keymap(bufnr, ... )
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
