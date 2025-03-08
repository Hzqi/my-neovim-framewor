-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
  return
end

-- Function to sanitize LSP progress output
local function safe_lsp_progress()
  local ok, lsp_status = pcall(vim.lsp.status) -- Prevents crashes
  if not ok then return "" end -- Return empty string if error occurs
  return lsp_status:gsub("[<>]", "") -- Remove illegal characters
end

lualine.setup({
    options = {
      theme = "tokyonight",
      component_separators = { left = "|", right = "|" },
      -- https://github.com/ryanoasis/powerline-extra-symbols
      section_separators = { left = " ", right = "" },
    },
    extensions = { "nvim-tree", "toggleterm" },
    sections = {
      lualine_c = {
        "filename",
        {
          --"lsp_progress",
          safe_lsp_progress, -- Use sanitized LSP progress
          spinner_symbols = { " ", " ", " ", " ", " ", " " },
        },
      },
      lualine_x = {
        "filesize",
        {
          "fileformat",
          -- symbols = {
          --   unix = '', -- e712
          --   dos = '', -- e70f
          --   mac = '', -- e711
          -- },
          symbols = {
            unix = "LF",
            dos = "CRLF",
            mac = "CR",
          },
        },
        "encoding",
        "filetype",
      },
    },
  })
