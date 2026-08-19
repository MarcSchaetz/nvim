vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("n", "<leader>w", "<CMD>update<CR>", { desc = "Fast save", silent = true })
vim.keymap.set("n", "<leader>q", "<CMD>quit<CR>", { desc = "Fast quit", silent = true })
vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>", { desc = "Remove search highlight", silent = true })

vim.keymap.set('i', '<C-e>', 'copilot#Accept("<CR>")', { expr = true, silent = true, script = true })
vim.keymap.set('i', '<C-d>', 'copilot#Dismiss()', { expr = true, silent = true, script = true })
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')

vim.keymap.set('n', '<leader>c', '<CMD>LspClangdSwitchSourceHeader<CR>', { desc = "Switch between source/header file", silent = true })

vim.lsp.buf.format = function()
	require("conform").format({ async = true })
end

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "LSP Format" })
vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "LSP Definition" })
vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { desc = "LSP Declaration" })


vim.schedule(function()
	-- fzf.lua keymaps
	local fl = require("fzf-lua")
	vim.keymap.set("n", "<leader>ss", fl.builtin, { desc = "fzf.lua: Show Builtin" })
	vim.keymap.set("n", "<leader>so", fl.oldfiles, { desc = "fzf.lua: Show old files" })
	vim.keymap.set("n", "<leader>sf", fl.files, { desc = "fzf.lua: Show files" })
	vim.keymap.set("n", "<leader><leader>", fl.buffers, { desc = "fzf.lua: Show buffers" })
	vim.keymap.set("n", "<leader>sg", fl.live_grep, { desc = "fzf.lua: Live grep" })
	vim.keymap.set("n", "<leader>/", fl.lgrep_curbuf, { desc = "fzf.lua: Find in current buffer" })


	-- oil.nvim
	vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Oil", silent = true })

	if vim.g.loaded_copilot_chat then
		vim.keymap.set("n", "<leader>kc", "<CMD>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat", silent = true })
	end

end)

