-- SETTINGS: General settings ==================================================

-- Disable the netrw_banner in the file explorer
vim.g.netrw_banner = 0

-- Enable truecolor 24-bit support
vim.opt.termguicolors = true

-- SETTINGS: Line numbers ======================================================
vim.opt.nu = true
vim.opt.relativenumber = true

-- SETTINGS: Tab key behavior ==================================================
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Convert tabs to spaces
vim.opt.expandtab = true

-- SETTINGS: Editor settings ===================================================
vim.opt.wrap = false
vim.opt.smartindent = true

-- Allow the %s (search incremental) command to have a split view
vim.opt.inccommand = "split"

-- Set splits to appear properly from below (example type :h)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Search options (make it case sensitive)
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable persistent undo (located in ~/.local/share/nvim/undodir)
-- You should create the dir if you don't have it
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

-- Enable the system clipboard by default
vim.opt.clipboard:append("unnamedplus")

-- Allow @ in the file names
vim.opt.isfname:append("@-@")

-- Set cursor to an empty string (delegats cursor shape to the terminal)
vim.opt.guicursor = ""

-- Scroll distance (keeps X lines above/below the cursor while scrolling)
vim.opt.scrolloff = 8

-- Enable a small gap to the left side of the line numbers column
vim.opt.signcolumn = "yes"

-- Make the command line minimal (only shows when : is pressed)
vim.o.cmdheight = 0

-- "Yank" highlight
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    callback = function()
        vim.hl.on_yank()
    end,
})

-- SETTINGS: Plugins-related tweaks ============================================

-- Improve Mini Picker behavior
vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")
