return {
    "iagorrr/noctis-high-contrast.nvim",
    "ember-theme/nvim",
    "kkga/vim-envy",
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
    -- Rustaceanvim
    {
        "mrcjkb/rustaceanvim",
        version = "^8",
        lazy = false,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
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
}
