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

    local buf = vim.api.nvim_create_buf(true, true)
    local win = vim.api.nvim_open_win(buf, true, opts) -- Open float window
    vim.api.nvim_set_current_win(win)

    vim.fn.termopen(vim.o.shell)
end, {})

function move_window(direction)
    local win = vim.api.nvim_get_current_win() -- Get the window under the cursor
    local config = vim.api.nvim_win_get_config(win) -- Get its current config
    local ui = vim.api.nvim_list_uis()[1]
    local step = 5 -- Movement step size

    -- Ensure it's a floating window before moving
    if config.relative == "" then
        return -- Not a floating window, do nothing
    end

    -- Adjust position based on direction
    if direction == "right" then
        config.col = math.min(ui.width - 5, config.col + step)
    elseif direction == "left" then
        config.col = math.max(0, config.col - step)
    elseif direction == "up" then
        config.row = math.max(0, config.row - step)
    elseif direction == "down" then
        config.row = math.min(ui.height - 5, config.row + step)
    end

    -- Apply the new position
    vim.api.nvim_win_set_config(win, config)
end


