-- n Normal 模式
-- i Insert 模式
-- v Visual 模式
-- t Terminal 模式
-- c Command 模式


-- <Leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- neovide中的mac alt is meta
-- vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_input_macos_option_key_is_meta = "both"

-- 由于要设置很多快捷键，所以先保存本地变量。
-- map('模式', '按键', '映射为', 'options')
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
-- options 大部分会设置为 { noremap = true, silent = true }
-- noremap 表示不会重新映射，比如你有一个映射 A -> B , 还有一个 B -> C，这个时候如果你设置 noremap = false 的话，表示会重新映射，那么 A 就会被映射为 C
-- silent 为 true，表示不会输出多余的信息。
local opt = {noremap = true, silent = true }

-- MacOS的一些在Neovid里Command的配置
vim.g.neovide_input_use_logo = true
-- 粘贴
vim.opt.clipboard = "unnamedplus"
map("n", "<D-v>", "p", opt)
map("i", "<D-v>", "<C-R>+", opt)
map("v", "<D-v>", "<C-R>+", opt)
-- 复制
map("n", "<D-c>", "", opt)
map("i", "<D-c>", "", opt)
map("v", "<D-c>", "y", opt)
-- 撤回
map("n", "<D-z>", ":undo<CR>", opt)
map("i", "<D-z>", "<ESC>:undo<CR>A", opt)
-- 重做
map("n", "<D-S-z>", ":redo<CR>", opt)
map("i", "<D-S-z>", "<ESC>:redo<CR>A", opt)
-- 保存
map("n", "<D-s>", ":w<CR>", opt)
map("i", "<D-s>", "<ESC>:w<CR>A", opt)

-- 为兼容iterm2
map("n", "<A-v>", "p", opt)
map("i", "<A-v>", "<C-R>+", opt)
map("v", "<A-v>", "<C-R>+", opt)
-- 复制
map("n", "<A-c>", "", opt)
map("i", "<A-c>", "", opt)
map("v", "<A-c>", "y", opt)
-- 撤回
map("n", "<A-z>", ":undo<CR>", opt)
map("i", "<A-z>", "<ESC>:undo<CR>A", opt)
-- 重做
map("n", "<A-S-z>", ":redo<CR>", opt)
map("i", "<A-S-z>", "<ESC>:redo<CR>A", opt)
-- 保存
map("n", "<A-s>", ":w<CR>", opt)
map("i", "<A-s>", "<ESC>:w<CR>A", opt)
-- windows + powertoys saves
map("n", "<C-s>", ":w<CR>", opt)
map("i", "<C-s>", "<ESC>:w<CR>A", opt)
map("n", "<C-v>", "p", opt)
map("i", "<C-v>", "<C-R>+", opt)

-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "r", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- 保存退出
map("n", "WQ", ":wq<CR>", opt)
-- 直接退出
map("n", "QQ", ":q!<CR>", opt)

-- Alt + hjkl  窗口之间跳转
-- 向左
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<S-Left>", "<C-w>h", opt)
-- 向上
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<S-Up>", "<C-w>k", opt)
-- 向下
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<S-Down>", "<C-w>j", opt)
-- 向右
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<S-Right>", "<C-w>l", opt)

-- 窗口左右比例
map("n", "s<Left>", ":vertical resize -10<CR>", opt)
map("n", "s<Right>", ":vertical resize +10<CR>", opt)
-- 窗口上下比例
map("n", "s<Up>", ":resize +10<CR>", opt)
map("n", "s<Down>", ":resize -10<CR>", opt)

-- Terminal相关
--map("n", "<leader>T", ":sp | terminal<CR>", opt)
map("n", "<leader>T", ":OpenFloatTerminal<CR>", opt)
map("n", "ww", "<C-w>w", opt)
--map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<S-Left>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<S-Down>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<S-Up>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<S-Right>", [[ <C-\><C-N><C-w>l ]], opt)

-- float window
map("n", "f<Right>", ":lua move_window('right')<CR>", opt)
map("n", "f<Left>", ":lua move_window('left')<CR>", opt)
map("n", "f<Up>", ":lua move_window('up')<CR>", opt)
map("n", "f<Down>", ":lua move_window('down')<CR>", opt)

-- visual模式下缩进代码
-- 反缩进
map("v", "<", "<gv", opt)
map("v", "<S-Tab>", "<gv", opt) -- 在warp下无效，是warp的bug，未修复
-- 缩进
map("v", ">", ">gv", opt)
map("v", "<tab>", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- 左右滚动
map("n", "<C-h>", "4h", opt)
map("n", "<C-l>", "4l",opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- MacOS下的移动
map("n", "<D-Up>", "4k", opt)
map("n", "<D-Down>", "4j", opt)
map("n", "<D-Left>", "4h", opt)
map("n", "<D-Right>", "4l", opt)
map("n", "<A-Up>", "6k", opt)
map("n", "<A-Down>", "6j", opt)
map("n", "<A-Left>", "6h", opt)
map("n", "<A-Right>", "6l", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<D-Left>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
map("i", "<D-Right>", "<ESC>A", opt)

-- visual 模式下快速移动（Mac）
map("v", "<D-Up>", "4k", opt)
map("v", "<D-Down>", "4j", opt)
map("v", "<D-Left>", "4h", opt)
map("v", "<D-Right>", "4l", opt)
map("v", "<A-Up>", "6k", opt)
map("v", "<A-Down>", "6j", opt)
map("v", "<A-Left>", "6h", opt)
map("v", "<A-Right>", "6l", opt)

-- (MasOS) 选中单词
map("n", "<D-e>", "<ESC>viw", opt)
map("v", "<D-e>", "iw", opt)
map("i", "<D-e>", "<ESC>viw", opt)

map("n", "<A-e>", "<ESC>viw", opt)
map("v", "<A-e>", "iw", opt)
map("i", "<A-e>", "<ESC>viw", opt)

-- 插件快捷键
local pluginKeys = {}

-- bufferline
-- 左右Tab切换
map("n", "<C-S-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Leader><Right>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-S-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<leader><Left>", ":BufferLineCyclePrev<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<leader>w", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<leader>p", ":Telescope find_files<CR>", opt)
map("n", "<leader>pp", ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>", opt)
-- 全局搜索
map("n", "<leader>f", ":Telescope live_grep<CR>", opt)
map("n", "<leader>ff", ":FzfLua lsp_live_workspace_symbols<CR>", opt)

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>tt", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

-- formatting
function FormatFunction()
  vim.lsp.buf.format({
    async = true,
    range = {
      ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    }
  })
end
map("n", "Ff", ":lua vim.lsp.buf.format()<CR>", opt)
map("v", "ff", ":lua FormatFunction()<CR>", opt)


-- git (vgit)
map("n", "<leader>gi", ":VGit project_diff_preview<CR>", opt)
map("n", "<leader>gc", ":VGit project_commit_preview<CR>", opt)
-- 向上向下翻diff
map("n", "g<Up>", ":VGit hunk_up<CR>", opt)
map("n", "g<Down>", ":VGit hunk_down<CR>", opt)

-- lsp快捷键
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- go xx
  --mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
end
-- 上面部分代码不行，直接使用map试试
-- safe_run
local function safe_run(lspsaga_cmd, fallback)
  return function()
    local success, _ = pcall(vim.cmd, lspsaga_cmd)
    if not success then
      fallback()
    end
  end
end
local lsp_utils = require("lsp.utils")
vim.keymap.set("n", "gd", safe_run("Lspsaga peek_definition", lsp_utils.preview_definition ), opt)
vim.keymap.set("n", "gdd", safe_run("Lspsaga goto_definition", vim.lsp.buf.definition), opt)
vim.keymap.set("n", "grn", safe_run("Lspsaga rename", vim.lsp.buf.rename), opt)
vim.keymap.set("n", "ga", safe_run("Lspsaga code_action", vim.lsp.buf.code_action), opt)
vim.keymap.set("n", "gh", safe_run("Lspsaga hover_doc", vim.lsp.buf.hover), opt)
vim.keymap.set("n", "gr", safe_run("Lspsaga finder", vim.lsp.buf.references), opt)
vim.keymap.set("n", "gp", safe_run("Lspsaga show_line_diagnostics", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end), opt)

-- 补全
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-n>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<D-n>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<Right>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end

-- clojure相关
-- 进入命令模式并链接
map("n", "<leader>mc", ":ConjureConnect", opt)
-- 打开log窗口
map("n", "<leader>mv", ":ConjureLogVSplit<CR>", opt)
-- 关闭
map("n", "<leader>mb", ":ConjureLogCloseVisible<CR>", opt)
-- eval当前form
map("n", "<leader>me", ":ConjureEvalRootForm<CR>", opt)
-- eval整个文件
map("n", "<leader>mf", ":ConjureEvalBuf<CR>", opt)

return pluginKeys
