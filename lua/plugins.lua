local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'
        use({'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", branch = "master", commit = "cf12346a3414fa1b06af75c79faebe7f76df080a"})
        -- 你的插件列表...
        -- conjure
        use({ 'Olical/conjure', commit = "f66b3e7f45d325bd556cd785502761e583971920" })

        -- UI theme
        -- tokyonight
        use({ "folke/tokyonight.nvim", commit = "cdc07ac78467a233fd62c493de29a17e0cf2b2b6" })
        -- nord
        use({ "shaunsingh/nord.nvim", commit = "80c1e5321505aeb22b7a9f23eb82f1e193c12470" })
        -- onedark
        use({ "ful1e5/onedark.nvim", commit = "b5161f0c631571640485be5d1c059cab82c86872" })
        -- nightfox
        use({ "EdenEast/nightfox.nvim", commit = "ba47d4b4c5ec308718641ba7402c143836f35aa9" })
        -- gruvbox
        use({'rmehri01/onenord.nvim', commit = "b68f1e66736840e837c2a77ebff59c932fcb70c7"})

        -- notification
        use { 'rcarriga/nvim-notify', commit = "8701bece920b38ea289b457f902e2ad184131a5d" }

        -- nvim-tree
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", commit = "8f392fa763b7ee80a48c714b630acaf6d1fe1854" })

        -- bufferline
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }, commit = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3"})

        -- buffer manager
        use({'j-morano/buffer_manager.nvim', commit = "a0ac2db39c8bd4a2b6ca897f38c88770f90d9323"})
        use({'nvim-lua/plenary.nvim', commit = "74b06c6c75e4eeb3108ec01852001636d85a932b"})

        -- lualine
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" }, commit = "a905eeebc4e63fdc48b5135d3bf8aea5618fb21c" })
        use("arkav/lualine-lsp-progress") -- if you want to pin this, you can add commit too

        -- telescope
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" }, commit = "471eebb1037899fd942cc0f52c012f8773505da1" }
        -- telescope extensions
        use({"LinArcX/telescope-env.nvim", commit = "00a703cc7b713cdda0a981d88fddf3ce25502af5"})
        use { "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" }, commit = "bd281b94448a4672fb491da78e2e27047378c7ad" }

        -- dashboard-nvim
        use({"glepnir/dashboard-nvim", commit = "62a10d9d55132b338dd742afc3c8a2683f3dd426"})

        -- project
        use({"ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb"})

        -- git
        use({'tanvirtin/vgit.nvim', requires = {'nvim-lua/plenary.nvim'}, tag="v1.0.6"})

        -- lsp相关
        use({ "williamboman/mason.nvim", commit = "b03fb0f20bc1d43daf558cda981a2be22e73ac42" })
        use({ "williamboman/mason-lspconfig.nvim", commit = "0a3b42c3e503df87aef6d6513e13148381495c3a" })
        use({ "neovim/nvim-lspconfig", commit = "b80f82f59544f0770981b5a6c7d129ca276dab36" })

        -- 补全
        use({"hrsh7th/nvim-cmp", commit = "a1d504892f2bc56c2e79b65c6faded2fd21f3eca"})
        use({"hrsh7th/vim-vsnip", commit = "9bcfabea653abdcdac584283b5097c3f8760abaa"})
        use({"hrsh7th/cmp-vsnip", commit = "989a8a73c44e926199bfd05fa7a516d51f2d2752"})
        use({"hrsh7th/cmp-nvim-lsp", commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef"})
        use({"hrsh7th/cmp-buffer", commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657"})
        use({"hrsh7th/cmp-path", commit = "c642487086dbd9a93160e1679a1327be111cbc25"})
        use({"hrsh7th/cmp-cmdline", commit = "d126061b624e0af6c3a556428712dd4d4194ec6d"})
        use({"rafamadriz/friendly-snippets", commit = "6cd7280adead7f586db6fccbd15d2cac7e2188b9"})

        -- lsp-ui
        use({"onsails/lspkind-nvim", commit = "c7274c48137396526b59d86232eabcdc7fed8a32"})
        use({"lukas-reineke/indent-blankline.nvim", commit = "d28a3f70721c79e3c5f6693057ae929f3d9c0a03"})
        use({"nvimdev/lspsaga.nvim", commit = "562d9724e3869ffd1801c572dd149cc9f8d0cc36"})

        -- nvim-autopairs
        use({"windwp/nvim-autopairs", commit = "59bce2eef357189c3305e25bc6dd2d138c1683f5"})

        -- surround
        use({"ur4ltz/surround.nvim", commit = "36c253d6470910692491b13382f54c9bab2811e1"})

        -- dart, flutter
        use({'akinsho/flutter-tools.nvim', requires = { 'nvim-lua/plenary.nvim' }, commit = "677cc07c16e8b89999108d2ebeefcfc5f539b73c"})

        -- java
        use({'nvim-java/nvim-java', requires = {
          'nvim-java/nvim-java-core',
          'nvim-java/nvim-java-dap',
          'nvim-java/nvim-java-test',
          'nvim-java/lua-async',
          'nvim-java/nvim-java-refactor',
          'MunifTanjim/nui.nvim',
          "JavaHello/spring-boot.nvim",
        }, commit = "602a5f7fa92f9c1d425a2159133ff9de86842f0a"})

        -- dap
        use({ 'mfussenegger/nvim-dap', commit = "45a69eba683a2c448dd9ecfc4de89511f0646b5f" })
        use { "rcarriga/nvim-dap-ui", requires = {
          "mfussenegger/nvim-dap",
          "nvim-neotest/nvim-nio"
        }, commit = "1a66cabaa4a4da0be107d5eda6d57242f0fe7e49" }

        -- vue
        use({ 'posva/vim-vue', commit = "6ae8fa751fbe4c6605961d2309f8326873fa40a6" })

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
