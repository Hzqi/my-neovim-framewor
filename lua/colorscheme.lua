-- local colorscheme = "tokyonight"
-- local colorscheme = "nord"
-- local colorscheme = "onedark"
-- local colorscheme = "nordfox"
--local colorscheme = "nightfox"
local colorscheme = "onenord"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

local scheme = require(colorscheme)
scheme.setup({
  options={
    transparent = true
  }
})
scheme.load()
