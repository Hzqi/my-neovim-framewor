local status, indent_blankline = pcall(require, "ibl")
if not status then
  vim.notify("没有找到 indent_blankline (ibl)")
  return
end

-- for version 3

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local highlight_lite = {
  "RainbowLiteRed",
  "RainbowLiteYellow",
  "RainbowLiteBlue",
  "RainbowLiteOrange",
  "RainbowLiteGreen",
  "RainbowLiteViolet",
  "RainbowLiteCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowLiteRed", { fg = "#f4cccc" })
    vim.api.nvim_set_hl(0, "RainbowLiteYellow", { fg = "#fff2cc" })
    vim.api.nvim_set_hl(0, "RainbowLiteBlue", { fg = "#9fc5e8" })
    vim.api.nvim_set_hl(0, "RainbowLiteOrange", { fg = "#fce5cd" })
    vim.api.nvim_set_hl(0, "RainbowLiteGreen", { fg = "#d9ead3" })
    vim.api.nvim_set_hl(0, "RainbowLiteViolet", { fg = "#d9d2e9" })
    vim.api.nvim_set_hl(0, "RainbowLiteCyan", { fg = "#a7e9f2" })

    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }

indent_blankline.setup({
  indent = { 
    char = "┊",
    tab_char = " ",
    highlight = highlight,
    smart_indent_cap = true
  },
  whitespace = {
    --highlight = highlight,
    remove_blankline_trail = true,
  },
  scope = {
    char = '┃', -- '│', --"▎",
    highlight = highlight,
  },
  exclude = {
    filetypes = {
      "dashboard",
      "packer",
      "terminal",
      "help",
      "log",
      "markdown",
      "TelescopePrompt",
      "lsp-installer",
      "lspinfo",
      "toggleterm",
    }
  }
})

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

