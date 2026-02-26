return {

	"ibhagwan/fzf-lua",
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	config = function()
		local fl = require "fzf-lua"
		fl.register_ui_select()
		fl.setup({
			winopts = {
				preview = {
					layout = "vertical" }
			}
		})
	end

}
