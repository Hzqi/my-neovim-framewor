-- n Normal 模式
-- i Insert 模式
-- v Visual 模式
-- t Terminal 模式
-- c Command 模式


-- <Leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- neovide中的mac alt is meta
vim.g.neovide_input_macos_alt_is_meta = true

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
map("n", "<A-Left>", "<C-w>h", opt)
-- 向上
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-Up>", "<C-w>k", opt)
-- 向下
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-Down>", "<C-w>j", opt)
-- 向右
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<A-Right>", "<C-w>l", opt)

-- 窗口左右比例
map("n", "s<Left>", ":vertical resize -10<CR>", opt)
map("n", "s<Right>", ":vertical resize +10<CR>", opt)
-- 窗口上下比例
map("n", "s<Up>", ":resize +10<CR>", opt)
map("n", "s<Down>", ":resize -10<CR>", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-Left>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-Down>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-Up>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-Right>", [[ <C-\><C-N><C-w>l ]], opt)

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

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- 插件快捷键
local pluginKeys = {}

-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Leader><Right>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<leader><Left>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<leader>w", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<leader>p", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader>f", ":Telescope live_grep<CR>", opt)

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
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
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

-- treesitter
-- 全文件格式化
map("n", "F=", "gg=G", opt)


-- git (vgit)
map("n", "<leader>gd", ":VGit project_diff_preview<CR>", opt)
map("n", "<leader>gc", ":VGit project_commit_preview<CR>", opt)
-- 向上向下翻diff
map("n", "g<Up>", ":VGit hunk_up<CR>", opt)
map("n", "g<Down>", ":VGit hunk_down<CR>", opt)

-- lsp快捷键
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
end
-- 上面部分代码不行，直接使用map试试
map("n", "grn", ":Lspsaga rename<CR>", opt)
map("n", "gca", ":Lspsaga code_action<CR>", opt)
map("n", "gh", ":Lspsaga hover_doc<CR>", opt)
map("n", "gr", ":Lspsaga lsp_finder<CR>", opt)
map("n", "gp", ":Lspsaga show_line_diagnostics<CR>", opt)

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
        ["<D-Up>"] = cmp.mapping.select_prev_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        --[">"] = cmp.mapping.select_next_item(),
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

return pluginKeys
