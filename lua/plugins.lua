local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'
        use({'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"})
        -- 你的插件列表...
        -- conjure

        -- UI theme
        -- tokyonight
        use("folke/tokyonight.nvim")
        -- nord
        use("shaunsingh/nord.nvim")
        -- onedark
        use("ful1e5/onedark.nvim")
        -- nightfox
        use("EdenEast/nightfox.nvim")
        -- gruvbox
        use('rmehri01/onenord.nvim')


        -- nvim-tree
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", commit = "8f392fa763b7ee80a48c714b630acaf6d1fe1854" })

        -- bufferline
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

        -- buffer manager
        use({'nvim-lua/plenary.nvim'})
        use({'j-morano/buffer_manager.nvim'})

        -- lualine
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")

        -- telescope
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
        -- telescope extensions
        use "LinArcX/telescope-env.nvim"
        use { "ibhagwan/fzf-lua",
              -- optional for icon support
              requires = { "nvim-tree/nvim-web-devicons" }
              -- or if using mini.icons/mini.nvim
              -- requires = { "echasnovski/mini.icons" }
        }

        -- dashboard-nvim
        use({"glepnir/dashboard-nvim"})

        -- project
        use("ahmedkhalf/project.nvim")

        -- git
        use({'tanvirtin/vgit.nvim', requires = {'nvim-lua/plenary.nvim'}})

        -- lsp相关
        use({ "williamboman/mason.nvim" })
        use({ "williamboman/mason-lspconfig.nvim" })
        -- use("williamboman/nvim-lsp-installer")
        use({ "neovim/nvim-lspconfig" })
        -- 补全
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        -- snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        -- 常见语言代码段
        use("rafamadriz/friendly-snippets")
        -- lsp-ui
        use("onsails/lspkind-nvim")
        -- indent-blankline 范围线
        use("lukas-reineke/indent-blankline.nvim")
        -- lsp查看功能的美化
        -- use("tami5/lspsaga.nvim" )
        use("nvimdev/lspsaga.nvim")
        -- use { 'kkharji/lspsaga.nvim' }

        -- 代码格式化
        -- use("mhartington/formatter.nvim")

        -- nvim-autopairs
        use("windwp/nvim-autopairs")

        -- surround
        use("ur4ltz/surround.nvim")

        -- clojure
        use("Olical/conjure")

        -- dart, flutter
        use({'akinsho/flutter-tools.nvim', requires = {
          'nvim-lua/plenary.nvim',
          -- 'stevearc/dressing.nvim', -- optional for vim.ui.select
        }})

        -- java
        --use('mfussenegger/nvim-jdtls')
        --use("JavaHello/spring-boot.nvim")
        use({'nvim-java/nvim-java', requires = {
          'nvim-java/nvim-java-core',
          'nvim-java/nvim-java-dap',
          'nvim-java/nvim-java-test',
          'nvim-java/lua-async',
          'nvim-java/nvim-java-refactor',
          'MunifTanjim/nui.nvim',
          "JavaHello/spring-boot.nvim",
        }})
        -- dap
        use('mfussenegger/nvim-dap')
        use { "rcarriga/nvim-dap-ui", requires = {
          "mfussenegger/nvim-dap",
          "nvim-neotest/nvim-nio"
        }}

        -- vue
        use('posva/vim-vue')

    end,
    config = {
        -- 并发数限制
        max_jobs = 16,
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})


-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
