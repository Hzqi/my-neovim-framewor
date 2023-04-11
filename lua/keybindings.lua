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


-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)

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

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
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
return pluginKeys
