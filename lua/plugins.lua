return {
    "iagorrr/noctis-high-contrast.nvim",
    "ramojus/mellifluous.nvim",
    -- Indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│" },
            scope = { enabled = false },
        },
    },
    -- LSP configuration
    "neovim/nvim-lspconfig",
    -- Autocomplete
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- Snippets
    "L3MON4D3/LuaSnip",
    -- Rustaceanvim
    {
        "mrcjkb/rustaceanvim",
        version = "^8",
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter").install { "rust", "lua", "markdown", "markdown_inline" }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("telescope").setup {
                pickers = {
                    find_files = {
                        find_command = { "rg", "--files", "--no-require-git" },
                    },
                    live_grep = {
                        vimgrep_arguments = {
                            "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--no-require-git"
                        },
                    },
                },
            }
        end,
    },
    { -- File explorer (tree)
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
        end,
    },
    "editorconfig/editorconfig-vim",
    {
        "numToStr/Comment.nvim",
        opts = {
            toggler = {
                line = "<leader>c/",
                block = "<leader>cb",
            },
            opleader = {
                line = "<leader>c/",
                block = "<leader>cb",
            },
        },
    },
}
