-- ******************************
--
-- 		 Basic options
--
-- ******************************

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.breakindent = true
vim.o.undofile = true
vim.o.undolevels = 100
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.winborder = 'rounded'
vim.o.completeopt = 'menu,popup,noinsert'
vim.o.scrolloff = 8
vim.o.splitright = true
vim.o.undolevels = 1000

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable undercurl escape sequences
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
