function open_floating_window()
    local ui = vim.api.nvim_list_uis()[1]
    local width, height = ui.width, ui.height
    local win_width, win_height = 60, 10

    local opts = {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = height - win_height - 4,
        col = width - win_width,
        style = "minimal",
        border = "rounded"
    }

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, opts) -- Open float window
    vim.api.nvim_set_current_win(win)
end

vim.api.nvim_create_user_command("OpenFloatWindow", function()
  open_floating_window()
end, {})

vim.api.nvim_create_user_command("OpenFloatTerminal", function()
  local ui = vim.api.nvim_list_uis()[1]
    local width, height = ui.width, ui.height
    local win_width, win_height = 60, 10

    local opts = {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = height - win_height - 4,
        col = width - win_width,
        style = "minimal",
        border = "rounded"
    }

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, opts) -- Open float window
    vim.api.nvim_set_current_win(win)

    vim.fn.termopen(vim.o.shell)
end, {})


