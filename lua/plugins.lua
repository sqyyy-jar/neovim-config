return {
  { -- GitHub colorschemes
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup {
        options = {
          transparent = true,
        },
      }
    end,
  },
  { -- LSP configuration
    "neovim/nvim-lspconfig",
  },
  -- More autocomplete
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  { -- Autocomplete
    "hrsh7th/nvim-cmp",
  },
  { -- Snippets
    "L3MON4D3/LuaSnip",
  },
  { -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        -- Languages
        ensure_installed = { "rust", "lua", "markdown", "markdown_inline" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  { -- Telescope
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  },
  { -- Editorconfig
    "editorconfig/editorconfig-vim",
  },
  { -- File explorer (tree)
    "nvim-tree/nvim-tree.lua",
  },
  { -- Lua line (status line)
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
  { -- Comments
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = "<leader>cl", -- Comment line
        block = "<leader>cb", -- Comment block
      },
      opleader = {
        line = "<leader>cl", -- Comment line
        block = "<leader>cb", -- Comment block
      },
    },
  },
}
