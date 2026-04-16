
local opts = {
  settings = {
    cmd = { "clojure-lsp" },
    filetypes = { "clojure", "clojurescript", "edn" },
    -- preferred in 0.11+ when you only need marker names
    root_markers = {
      "project.clj",
      "deps.edn",
      "build.boot",
      "shadow-cljs.edn",
      ".git",
      "bb.edn",
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    local function buf_set_keymap( ...)
      vim.api.nvim_buf_set_keymap(bufnr, ... )
    end
    -- 绑定快捷键
    require('keybindings').mapLSP(buf_set_keymap)
  end,
}

