require("mason").setup()

-- <leader>f will use `conform` plugin only for languages with no built-in formatters,
-- thus lsp_format = "fallback"
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format local buffer with Conform" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
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
-- The names are specific from Neovim's official names and not the Mason names
local servers = {
    "vtsls",
    "eslint",
    "tailwindcss",
    "html",
    "jsonls",
    "lua_ls",
    "rust-analyzer",
    "marksman",
}

vim.lsp.enable(servers)
