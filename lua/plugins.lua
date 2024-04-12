return {
    -- Kanagawa colorschemes
    "rebelot/kanagawa.nvim",
    -- Bamboo colorschemes
    "ribru17/bamboo.nvim",
    -- Jellybeans colorschemes
    "nanotech/jellybeans.vim",
    -- Despacito colorschemes
    "AlessandroYorba/Despacio",
    -- Two-Firewatch colorschemes
    "rakr/vim-two-firewatch",
    -- Nightfox colorschemes
    "EdenEast/nightfox.nvim",
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
                        find_command = {
                            "rg",
                            "--files",
                            "--no-require-git",
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
        -- Lua line (status line)
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = false,
                    theme = "wombat",
                },
            }
        end,
    },
    {
        -- Comments
        "numToStr/Comment.nvim",
        opts = {
            toggler = {
                line = "<leader>cl",  -- Comment line
                block = "<leader>cb", -- Comment block
            },
            opleader = {
                line = "<leader>cl",  -- Comment line
                block = "<leader>cb", -- Comment block
            },
        },
    },
    {
        -- Metals
        "scalameta/nvim-metals",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local metals = require("metals").bare_config()
            metals.capabilities = require("cmp_nvim_lsp").default_capabilities()
        end,
    },
    {
        -- Transparent background
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup {
                groups = {
                    "Normal", "LineNr",
                },
            }
        end,
        lazy = false,
    },
}
