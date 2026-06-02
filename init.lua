require"config.options"
require"config.keymaps"
require"config.autocmds"
require"plugins"
require"config.lsp"

vim.cmd.colorscheme  "tokyonight-night"

-- set Normal and NormalFloat bg to none for picom transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
