local opt = vim.opt
local keymap = vim.keymap

-- Visuals
vim.cmd.colorscheme("github_dark")
opt.number = true
opt.relativenumber = true

-- Code style
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

-- Keybinds
--vim.keymap.set("n", "<leader>l", vim.diagnostic.open_float)
local telescope = require("telescope.builtin")
keymap.set("n", "<leader>ff", telescope.find_files, {}) -- Find files
keymap.set("n", "<leader>f/", telescope.live_grep, {}) -- Find in files
keymap.set("n", "<leader>,", telescope.buffers, {}) -- Find buffer
keymap.set("n", "<leader>fh", telescope.help_tags, {}) -- Find help
local tree = require("nvim-tree.api")
keymap.set("n", "<leader>ft", tree.tree.toggle, {}) -- File explorer

-- Other
opt.clipboard = "unnamedplus" -- Always use system clipboard

