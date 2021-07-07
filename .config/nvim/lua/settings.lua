local utils = require("utils")

local cmd = vim.cmd
local indent = 4
local undodir = "/home/chachi/.local/share/nvim/undodir"

cmd "syntax enable"
cmd "filetype plugin indent on"

utils.opt("o", "exrc", true)
utils.opt("o", "secure", true)
utils.opt("o", "shell", "/usr/bin/zsh")
utils.opt("o", "guicursor", "")

utils.opt("w", "number", true)
utils.opt("w", "relativenumber", true)

utils.opt("o", "hls", false)
utils.opt("o", "incsearch", true)
utils.opt("w", "wrap", false)
utils.opt("o", "errorbells", false)
utils.opt("o", "hidden", true)

utils.opt("b", "swapfile", false)
utils.opt("o", "backup", false)
utils.opt("o", "undodir", undodir)
utils.opt("b", "undofile", true)

utils.opt("o", "termguicolors", true)

utils.opt("o", "scrolloff", 10)
utils.opt("o", "updatetime", 50)

utils.opt("w", "signcolumn", "yes")

utils.opt("o", "background", "dark")
utils.opt("o", "showmode", false)

utils.opt("b", "expandtab", true)
utils.opt("b", "tabstop", indent)
utils.opt("b", "softtabstop", indent)
utils.opt("b", "shiftwidth", indent)
utils.opt("o", "smarttab", true)

utils.opt("b", "cindent", true)
utils.opt("b", "smartindent", true)
utils.opt("b", "autoindent", true)
utils.opt("b", "indentexpr", "")

utils.opt("o", "completeopt", "menuone,noinsert,noselect")

utils.opt("o", "mouse", "n")
vim.o.shortmess = vim.o.shortmess .. "c"

utils.opt("o", "autochdir", true)
vim.o.wildignore = vim.o.wildignore .. "*.png"

vim.g.t_8f = "<Esc>[38;2;%lu;%lu;%lum]"
-- vim.api.nvim_set_var("&t_8f", "<Esc>[38;2;%lu;%lu;%lum")
-- vim.api.nvim_set_var("&t_8f", "<Esc>[48;2;%lu;%lu;%lum")
