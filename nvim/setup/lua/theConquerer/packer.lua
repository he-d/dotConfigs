-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Telescope for fuzzy finding
    use {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.2',
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }

    -- Colorschemes
    use "rose-pine/neovim"
    use "rebelot/kanagawa.nvim"
    use "patstockwell/vim-monokai-tasty"
    use {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup {
                style = 'darker'
                -- style = 'dark'
                -- style = 'warm'
                -- style = 'warmer'
            }
        end
    }

    -- TreeSitter for syntax highlighting
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/playground"

    -- Harpoon for file navigation
    use "theprimeagen/harpoon"

    -- UndoTree
    use "mbbill/undotree"

    -- Git Plugin
    use "tpope/vim-fugitive"
    -- NeoGit
    use {
        "NeogitOrg/neogit",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }

    -- LSP and Autocompletion
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v1.x',
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets"
        }
    }

    -- Lualine with icons
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- Autopairs for auto-closing brackets
    use "windwp/nvim-autopairs"

    -- NeoTree as file explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        }
    }

    -- CommandLine UI
    use "folke/noice.nvim"

    -- Notification UI
    use "rcarriga/nvim-notify"

    -- Resolve Git Merge Conflicts
    use { "akinsho/git-conflict.nvim", tag = "*", config = function()
        require('git-conflict').setup()
    end }

    -- Markdown Preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Inbuild Terminal
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    -- Debugger
    use { "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.after.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.after.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }
    use { "jay-babu/mason-nvim-dap.nvim",
        requires = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        }
    }

    -- Tmux Setup
    use { "christoomey/vim-tmux-navigator" }
end)
