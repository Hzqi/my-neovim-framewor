local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {
    "json",
    "html",
    "css",
    "vim",
    "lua",
    "javascript",
    "typescript",
    "tsx",
    "clojure",
    "java",
    "markdown",
    "markdown_inline",
    "python",
    "dart",
    "yaml",
    "go",
    "elixir",
    "vue",
  },

  init = function() 
    vim.api.nvim_create_autocmd('FileType', { 
      callback = function() 
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start) 
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" 
      end, 
    }) 

    local ensure_installed = {
      "json",
      "html",
      "css",
      "vim",
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "clojure",
      "java",
      --"markdown",
      --"markdown_inline",
      "python",
      "dart",
      "yaml",
      "go",
      "elixir",
      "vue",
    }
    local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    local parsersToInstall = vim.iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require('nvim-treesitter').install(parsersToInstall)
  end,
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
})

-- 增加文件别名
vim.filetype.add({
  extension = {
    yjpl = "vue"
  }
})
