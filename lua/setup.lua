vim.cmd.colorscheme("midnight")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.g.c_syntax_for_h = 1
vim.opt.winborder = "bold"
vim.opt.signcolumn = "yes"

-- Autocomplete
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local lsp = require("lspconfig")
local lsp_defaults = lsp.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lsp_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

-- Keybinds
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})      -- Find files
vim.keymap.set("n", "<leader>f/", telescope.live_grep, {})       -- Find in files
vim.keymap.set("n", "<leader>,", telescope.buffers, {})          -- Find buffer
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})       -- Find help
local tree = require("nvim-tree.api")
vim.keymap.set("n", "<leader>ft", tree.tree.toggle, {})          -- File explorer
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})    -- Definition
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})        -- Rename
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})   -- Code actions
vim.keymap.set("n", "<leader>cx", telescope.diagnostics, {})     -- Diagnostics
vim.keymap.set("n", "<leader>cl", vim.diagnostic.open_float, {}) -- Diagnostics
local cmp = require("cmp")
vim.keymap.set("i", "<C-Space>", cmp.complete, {})               -- Autocomplete
vim.keymap.set("n", "<bar>", vim.cmd.vsplit, {})
vim.keymap.set("n", "<bslash>", vim.cmd.split, {})

-- LSP
-- Rust analyzer
for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end
-- Zig
lsp.zls.setup {}
-- Lua
lsp.lua_ls.setup {}
-- OCaml
lsp.ocamllsp.setup {}
-- C
lsp.clangd.setup {}
-- JavaScript
-- lsp.biome.setup {}
lsp.ts_ls.setup {}
lsp.svelte.setup {}
lsp.cssls.setup {}
-- Format-on-save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function() vim.lsp.buf.format() end,
})

-- Autocomplete
local luasnip = require("luasnip")
local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "buffer",   keyword_length = 3 },
        { name = "luasnip",  keyword_length = 2 },
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
}
