
local ok, mason = pcall(require, "mason")
if not ok then
  vim.notify("没有找到 mason")
  return
end

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  vim.notify("没有找到 mason-lspconfig")
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "jsonls",
    "html",
    --"clojure_lsp",
    "jedi_language_server",
    "ts_ls",
    --"gopls", 
    --"elixirls", 
    --"jdtls", 
    --"java_language_server", 
    --"volar",
  },
})

local servers = {
  lua_ls = require("lsp.config.lua"),
  clojure_lsp = require("lsp.config.clojure"),
  ts_ls = require("lsp.config.js"),
  jedi_language_server = require("lsp.config.python"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    vim.lsp.config(name, config)
  end
  vim.lsp.enable(name)
end
