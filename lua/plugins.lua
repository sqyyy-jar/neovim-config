return {
    "dasupradyumna/midnight.nvim",
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
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            -- Blink
            parser_config.blink = {
                install_info = {
                    url = "https://github.com/sqyyy-jar/tree-sitter-blink.git",
                    files = { "src/parser.c" },
                    branch = "main",
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false,
                },
                filetype = "blink",
            }
            require("nvim-treesitter.configs").setup {
                -- Languages
                ensure_installed = { "rust", "lua", "markdown", "markdown_inline", "scheme" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
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
