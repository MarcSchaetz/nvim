vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.winborder = "rounded"
vim.o.completeopt = "menu,popup,noinsert"
vim.o.scrolloff = 8

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
