vim.cmd.colorscheme "noctishc"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.g.c_syntax_for_h = 1
vim.opt.winborder = "rounded"
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "+1"
vim.opt.wrap = false
vim.cin = false
vim.api.nvim_create_autocmd({ "TermOpen" }, {
    callback = function()
        vim.api.nvim_set_option_value("statuscolumn", "", { scope = "local" })
    end,
})
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Keybinds
local telescope = require "telescope.builtin"
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})      -- Find files
vim.keymap.set("n", "<leader>f/", telescope.live_grep, {})       -- Find in files
vim.keymap.set("n", "<leader>,", telescope.buffers, {})          -- Find buffer
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})       -- Find help
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})    -- Definition
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})        -- Rename
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})   -- Code actions
vim.keymap.set("n", "<leader>cx", telescope.diagnostics, {})     -- Diagnostics
vim.keymap.set("n", "<leader>cl", vim.diagnostic.open_float, {}) -- Diagnostics
local nvim_tree = require "nvim-tree.api"
vim.keymap.set("n", "<leader>o", nvim_tree.tree.toggle, {})
vim.keymap.set("n", "<leader>j", function()
    vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "<leader>k", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)

-- TreeSitter
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

-- LSP
vim.lsp.enable "lua_ls"
vim.lsp.enable "ocamllsp"
vim.lsp.enable "clangd"
vim.lsp.enable "ts_ls"
vim.lsp.enable "svelte"
vim.lsp.enable "cssls"
vim.lsp.enable "sqruff"
vim.lsp.config("sourcekit", {
    filetypes = { "swift" },
})
vim.lsp.enable "sourcekit"

-- Format-on-save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function() vim.lsp.buf.format() end,
})
