local opts = {
  settings = {
    elixirLS = {
      -- 开启拨号器警告
      dialyzerEnabled = true,
      -- 保存文件时自动格式化
      formatOnSave = true,
      -- 提供建议的功能
      suggestSpecs = false
    },
    cmd = { "elixirls" },
    filetypes = { "elixir", "eelixir" },
    root_markers = {
      "mix.exs", ".git"
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

