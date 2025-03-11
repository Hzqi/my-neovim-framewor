local notify = require("notify")

vim.notify = notify

notify.setup({
  -- Animation style (see below for details)
  stages = "fade_in_slide_out",

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = nil,

  -- Function called when a window is closed
  on_close = nil,

  -- Render function for notifications. See notify-render()
  render = "default",

  -- Default timeout for notifications
  timeout = 5000,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
  background_colour = "Normal",

  -- Minimum width for notification windows
  minimum_width = 50,
})

local function capture_messages()
    local orig_notify = vim.notify
    vim.notify = function(msg, level, opts)
        -- Ensure messages do not show in the command line
        opts = opts or {}
        opts.title = opts.title or "Neovim"
        return orig_notify(msg, level, opts)
    end
end

capture_messages()

vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
    local level = ({ "error", "warn", "info", "debug" })[result.type]
    require("notify")(result.message, level, { title = "LSP" })
end
