return {
    "dasupradyumna/midnight.nvim",
    "forest-nvim/sequoia.nvim",
    "https://codeberg.org/m455/pleasant.vim",
    "iagorrr/noctis-high-contrast.nvim",
    "ramojus/mellifluous.nvim",
    -- Indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            -- ∣│
            indent = { char = "│" },
            scope = { enabled = false },
        },
    },
    -- FASM
    "fedorenchik/fasm.vim",
    -- Zig
    "ziglang/zig.vim",
    -- LSP configuration
    "neovim/nvim-lspconfig",
    -- More autocomplete
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- Autocomplete
    "hrsh7th/nvim-cmp",
    -- Snippets
    "L3MON4D3/LuaSnip",
    -- Rustaceanvim
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
    },
    {
        -- Treesitter
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter").install { "rust", "lua", "markdown", "markdown_inline" }
        end,
    },
    {
        -- Telescope
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
    { -- Editorconfig
        "editorconfig/editorconfig-vim",
    },
    { -- File explorer (tree)
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
        end,
    },
    {
        -- Comments
        "numToStr/Comment.nvim",
        opts = {
            toggler = {
                line = "<leader>c/",  -- Comment line
                block = "<leader>cb", -- Comment block
            },
            opleader = {
                line = "<leader>c/",  -- Comment line
                block = "<leader>cb", -- Comment block
            },
        },
    },
}
