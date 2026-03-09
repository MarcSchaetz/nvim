return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			c = { 'clang-format' },
			cpp = { 'clang-format' },
			lua = { 'stylua' },
			typescript = { 'prettier' },
			javascript = { 'prettier' },
			html = { 'prettier' },
			htmlangular = { 'prettier' },
			css = { 'prettier' },
			json = { 'prettier' },
			python = { 'black' },
		},
	},
}
