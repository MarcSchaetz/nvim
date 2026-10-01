-- ******************************
--
-- 		 Basic keymap
--
-- ******************************

local kmset = vim.keymap.set

-- Fast exit insert mode
kmset('i', 'jk', '<ESC>')
kmset('i', 'kj', '<ESC>')

-- Fast save and quit
kmset('n', '<leader>w', '<CMD>update<CR>', { desc = 'Fast save', silent = true })
kmset('n', '<leader>q', '<CMD>quit<CR>', { desc = 'Fast quit', silent = true })

-- Remove search highlight
kmset('n', '<ESC>', '<CMD>nohlsearch<CR>', { desc = 'Remove search highlight', silent = true })

-- LSP keymaps
kmset('n', '<leader>f', function() vim.lsp.buf.format() end, { desc = 'LSP Format' })
kmset('n', 'grd', function() vim.lsp.buf.definition() end, { desc = 'LSP Definition' })
kmset('n', 'grD', function() vim.lsp.buf.declaration() end, { desc = 'LSP Declaration' })

-- Clangd specific keymap to switch between source and header files
kmset('n', '<leader>c', '<CMD>LspClangdSwitchSourceHeader<CR>',
	{ desc = 'Switch between source/header file', silent = true })
