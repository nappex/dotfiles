-- OPTIONS
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.swapfile = false
vim.opt.mouse = a
vim.opt.listchars = { tab = '» ', lead = '·', trail = '·', nbsp = '␣' }
vim.opt.list = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- termguicolors is false by default, but it is good to know the option exist
-- if you set true it enable 24-bit RGB color in the TUI
vim.o.termguicolors = false
vim.cmd.colorscheme('slate')

require("keymaps")
