vim.pack.add({
    "https://github.com/roerohan/orng.nvim",
    "https://github.com/nvim-mini/mini.nvim",
})

---- mini files ----
local MiniFiles = require("mini.files")

-- Press `-` in NORMAL mode to activate
vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })

-- Press `<leader>-` to activate where the current file is open in the file system
vim.keymap.set("n", "<leader>-", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

MiniFiles.setup({
    mappings = {
        go_in = "<CR>",
        go_in_plus = "L",
        go_out = "_",
        go_out_plus = "H",
    },
})
