-- ALWAYS SET LEADER FIRST
vim.g.mapleader = " "

-- Replace the legacy UI (experimental)
require("vim._core.ui2").enable({})

-- Load options in /lua
require("options")

-- Load keymaps in /lua
require("keymaps")

-- Load commands
require("commands")

-- Load packs (add-ons)
require("pack")

-- Load custom color scheme
vim.cmd.colorscheme("moonfly")
