require("mason").setup()

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })
vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.diagnostic.config({ virtual_text = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

-- Lua needs this because it doesn't inherently know it's running inside an editor.
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

-- Add LSP downloaded on mason on this list (unless it's something like Prettier)
local servers = {
    "vtsls",
    "eslint-lsp",
    "tailwindcss-language-server",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "rust-analyzer",
    "marksman",
}

vim.lsp.enable(servers)
