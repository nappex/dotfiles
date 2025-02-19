-- OPTIONS
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.mouse = a
vim.o.listchars = 'tab:» ,lead:•,trail:•,nbsp:␣'
vim.o.list = true

-- termguicolors is false by default, but it is good to know the option exist
-- if you set true it enable 24-bit RGB color in the TUI
vim.o.termguicolors = false
vim.cmd.colorscheme('slate')

require("keymaps")
