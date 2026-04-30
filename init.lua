vim.g.mapleader = " "

-- Plugins
vim.pack.add {
  -- Dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  -- Colorschemes
  "https://github.com/iagorrr/noctis-high-contrast.nvim",
  -- Language servers
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mrcjkb/rustaceanvim",
  -- Miscellaneous
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-tree/nvim-tree.lua",
}

-- Plugin setup
require "nvim-tree".setup {}

-- Options
vim.cmd.colorscheme "noctishc"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.opt.winborder = "rounded"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.colorcolumn = "+1"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.cin = false
vim.g.c_syntax_for_h = 1

-- Treesitter grammars
vim.treesitter.language.add("bash", { path = "/usr/lib/tree-sitter/bash.so" })
vim.treesitter.language.add("c", { path = "/usr/lib/tree-sitter/c.so" })
vim.treesitter.language.add("diff", { path = "/usr/lib/tree-sitter/diff.so" })
vim.treesitter.language.add("json", { path = "/usr/lib/tree-sitter/json.so" })
vim.treesitter.language.add("lua", { path = "/usr/lib/tree-sitter/lua.so" })
vim.treesitter.language.add("markdown", { path = "/usr/lib/tree-sitter/markdown.so" })
vim.treesitter.language.add("markdown_inline", { path = "/usr/lib/tree-sitter/markdown_inline.so" })
vim.treesitter.language.add("python", { path = "/usr/lib/tree-sitter/python.so" })
vim.treesitter.language.add("query", { path = "/usr/lib/tree-sitter/query.so" })
vim.treesitter.language.add("rust", { path = "/usr/lib/tree-sitter/rust.so" })
vim.treesitter.language.add("vim", { path = "/usr/lib/tree-sitter/vim.so" })
vim.treesitter.language.add("vimdoc", { path = "/usr/lib/tree-sitter/vimdoc.so" })
-- TODO: zig

-- Language servers
vim.lsp.enable "clangd"
vim.lsp.enable "lua_ls"
vim.lsp.enable "zls"

-- Keybinds
local telescope = require "telescope.builtin"
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<leader>fi", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fd", telescope.diagnostics, {})
vim.keymap.set("n", "<leader>,", telescope.buffers, {})
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, {})
local nvim_tree = require "nvim-tree.api"
vim.keymap.set("n", "<leader>o", nvim_tree.tree.toggle, {})
vim.keymap.set("n", "<leader>j", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, {})
vim.keymap.set("n", "<leader>k", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, {})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function() vim.lsp.buf.format() end,
})
