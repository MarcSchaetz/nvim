-- ********************************************************************************
--
-- 						  Marc's Neovim Configuration
--
-- ********************************************************************************


-- Load basic vim configuration first
require"basic_options"
-- then load all native available keymaps
require"basic_keymap"
-- then load the native available autocommands
require"basic_autocmds"
-- then load all user commands
require"basic_usercmds"
-- then load all plugins
require"plugins"
-- lastly load all lsp configurations
require"lsp"
