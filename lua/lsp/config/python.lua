
local opts = {
  settings = {
    cmd = { "jedi-language-server" },
    filetypes = { "python" },
    root_markers = {
      "requirements.txt", "venv"
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

