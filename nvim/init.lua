vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = a

-- termguicolors is false by default, but it is good to know the option exist
-- if you set true it enable 24-bit RGB color in the TUI
vim.opt.termguicolors = false
vim.cmd.colorscheme('slate')

require("keymaps")
