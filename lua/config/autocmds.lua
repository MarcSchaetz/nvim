vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end
})


-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("my.lsp", {}),
-- 	callback = function(args)
-- 		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
-- 		local capabilities = require('blink.cmp').get_lsp_capabilities(client.capabilities)
-- 		client.capabilities = require("blink.cmp").get_lsp_capabilities(client.capabilities)
-- 		vim.lsp.config(client.name, client)
-- 	end
-- })
--
