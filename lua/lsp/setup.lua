
local status, mason = pcall(require, "mason")
if not status then
  vim.notify("没有找到 mason")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到 lspconfig")
  return
end

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
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
  }
})

local servers = {
  lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  --clojure_lsp = require("lsp.config.clojure"),
  ts_ls = require("lsp.config.js"),
  jedi_language_server = require("lsp.config.python"),
  --flutter_tools = require("lsp.config.flutter"),
  --gopls = require("lsp.config.go"),
  --elixirls = require("lsp.config.elixir"),
  --jdtls = require("lsp.config.java"),
  --jdtls = require("lsp.config.javals"),
  --java_language_server = require("lsp.config.javals"),
  --volar = require("lsp.config.vue"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end

