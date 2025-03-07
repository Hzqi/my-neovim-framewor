local M = {}

M.preview_definition = function ()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result, ctx, _)
    if not result or vim.tbl_isempty(result) then return end

    if vim.tbl_islist(result) then result = result[1] end

    local bufnr = vim.uri_to_bufnr(result.uri)
    if not vim.api.nvim_buf_is_loaded(bufnr) then
      vim.fn.bufload(bufnr)
    end

    local contents = vim.api.nvim_buf_get_lines(bufnr, result.range.start.line, result.range["end"].line + 1, false)

    -- Open a floating window
    local width = math.ceil(vim.o.columns * 0.6)
    local height = math.ceil(vim.o.lines * 0.3)
    local row = math.ceil((vim.o.lines - height) / 2)
    local col = math.ceil((vim.o.columns - width) / 2)

    local preview_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(preview_buf, 0, -1, false, contents)

    local preview_win = vim.api.nvim_open_win(preview_buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      border = "rounded",
    })

    vim.api.nvim_win_set_option(preview_win, "winhl", "Normal:NormalFloat")
  end)
end

return M
