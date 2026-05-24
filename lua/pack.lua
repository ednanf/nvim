vim.pack.add({
    { src = "https://github.com/roerohan/orng.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
})

-- IMPORTANT: it is necessary to also install tree-sitter via brew

---- MINI FILES ----
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

---- MINI NOTIFY ----
require("mini.notify").setup({
	-- only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

---- MINI CMDLINE COMPLETION ----
-- Add completions to the cmdline `:`
require("mini.cmdline").setup({
    autocorrect = { enable = false }
})

---- MINI SURROUND ----
-- Add the ability to surround selected lines with {}, {}, and etc.

-- Default Keymaps
-- | `sa`      | Add surrounding or Direct with 'saiw' |
-- | `sd`      | Delete surrounding                    |
-- | `sr`      | Replace surrounding                   |
-- | `sf`      | Find surrounding (right)              |
-- | `sF`      | Find surrounding (left)               |
-- | `sh`      | Highlight surrounding                 |
-- | `sn`      | Update n_lines                        |
-- | `l` / `n` | as suffix for prev/next               |

require("mini.surround").setup()

---- MINI PICKER ----
-- Simple file picker and grep
-- Example: <leader>pf is used to find files
--          <leader>ps is used to fuzzy search words
--          <leader>pk is used to find commands
--          <leader>xx is used to show file diagnostics (e.g. LSP)

local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")
MiniPick.setup()
MiniExtra.setup()

-- keymaps
vim.keymap.set("n", "<leader>pf", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>ps", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Grep word/Search word" })
vim.keymap.set("n", "<leader>vh", function() MiniPick.builtin.help() end, { desc = "Mini Help" })

vim.keymap.set("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>pk", function() MiniExtra.pickers.keymaps() end, { desc = 'Search keymaps' })

---- MINI COMPLETIONS ----
require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
        process_items = function(items, base)
            return MiniCompletion.default_process_items(items, base, {
                filtersort = "fuzzy",
            })
        end,
    }
})

---- MINI SNIPPETS ----
-- This is the plugin that shows windows with snippets like an IDE
-- It uses frinedly snippets (plugin) to populate
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets
    },
})
MiniSnippets.start_lsp_server({ match = false })

---- TREESITTER LOADING ----
require("treesitter")

---- LSP LOADING ----
require("lsp")
