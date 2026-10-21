-- ******************************
--
-- 		   Plugins
--
-- ******************************

local gh = function(url)
  return 'https://github.com/' .. url
end
local ghadd = function(url)
  vim.pack.add { gh(url) }
end
local kmset = vim.keymap.set

------------------------------
-- Color Scheme
------------------------------
ghadd 'folke/tokyonight.nvim'
vim.cmd.colorscheme 'tokyonight-night'
-- vim.cmd.colorscheme 'default'
require('tokyonight').setup {
  on_highlights = function(highlights, colors)
    highlights.LineNrAbove = { fg = colors.fg_dark }
    highlights.LineNr = { fg = colors.orange }
    highlights.LineNrBelow = { fg = colors.fg_dark }
    highlights.NormalFloat = { bg = 'none' }
    highlights.Normal = { bg = 'none' }
  end,
}
-- -- set Normal and NormalFloat bg to none for picom transparency
vim.api.nvim_set_hl(0, 'DiagnosticDeprecated', { fg = 'gray', strikethrough = false })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = false, undercurl = true })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

------------------------------
-- oil.nvim for file management
------------------------------
ghadd 'stevearc/oil.nvim'
require('oil').setup()
kmset('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'Open Oil', silent = true })

------------------------------
-- fzf-lua for fuzzy finding
------------------------------
ghadd 'ibhagwan/fzf-lua'
local fl = require 'fzf-lua'
fl.register_ui_select()
fl.setup {
  winopts = {
    preview = {
      layout = 'vertical',
    },
  },
}
-- fzf.lua keymaps
kmset('n', '<leader>ss', fl.builtin, { desc = 'fzf.lua: Show Builtin' })
kmset('n', '<leader>so', fl.oldfiles, { desc = 'fzf.lua: Show old files' })
kmset('n', '<leader>sf', fl.files, { desc = 'fzf.lua: Show files' })
kmset('n', '<leader><leader>', fl.buffers, { desc = 'fzf.lua: Show buffers' })
kmset('n', '<leader>sg', fl.live_grep, { desc = 'fzf.lua: Live grep' })
kmset('n', '<leader>/', fl.lgrep_curbuf, { desc = 'fzf.lua: Find in current buffer' })

------------------------------
-- QoL Plugins
------------------------------
ghadd 'folke/todo-comments.nvim'
require('todo-comments').setup()
ghadd 'rafamadriz/friendly-snippets'
vim.pack.add { { src = gh 'nvim-lua/plenary.nvim', version = 'master' } } -- for curl, log and async functions
ghadd 'neovim/nvim-lspconfig'

------------------------------
-- Mason.nvim for LSP management
------------------------------
ghadd 'mason-org/mason.nvim'
require('mason').setup()

------------------------------
-- Mini.nvim for small utilities
------------------------------
vim.pack.add { { src = gh 'nvim-mini/mini.nvim', version = 'stable' } }
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.cursorword').setup()
require('mini.icons').setup()
require('mini.diff').setup {
  view = {
    style = 'sign',
    signs = {
      -- add = '▎',
      -- change = '▎',
      -- delete = '',
      add = '+',
      change = '~',
      delete = '-',
    },
  },
}

vim.schedule(function()
  vim.api.nvim_set_hl(0, 'MiniDiffSignAdd', { fg = '#A6E22E' })
  vim.api.nvim_set_hl(0, 'MiniDiffSignChange', { fg = '#E6DB74' })
  vim.api.nvim_set_hl(0, 'MiniDiffSignDelete', { fg = '#F92672' })
end)

------------------------------
-- Conform.nvim for formatting
------------------------------
ghadd 'stevearc/conform.nvim'
require('conform').setup {
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
    markdown = { 'prettier' },
    python = { 'black' },
    rust = { 'rustfmt' },
  },
}
vim.schedule(function()
  vim.lsp.buf.format = function()
    require('conform').format { async = true }
  end
end)

------------------------------
-- Blink.nvim for LSP capabilities
------------------------------
vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' } }
require('blink-cmp').setup {
  -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- 'super-tab' for mappings similar to vscode (tab to accept)
  -- 'enter' for enter to accept
  -- 'none' for no mappings
  --
  -- All presets have the following mappings:
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  --
  -- See :h blink-cmp-config-keymap for defining your own keymap
  keymap = {
    preset = 'enter',
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  -- (Default) Only show the documentation popup when manually triggered
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
  },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lsp', 'buffer', 'path', 'snippets' },
    per_filetype = {
      opencode_ask = { 'lsp', 'buffer' },
    },
    providers = { lsp = { fallbacks = {} } },
  },

  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  -- opts_extend = { "sources.default" },
}

------------------------------
-- Copilot for AI assistance
------------------------------
ghadd 'gptlang/lua-tiktoken'
ghadd 'github/copilot.vim'
ghadd 'CopilotC-Nvim/CopilotChat.nvim'

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

require('CopilotChat').setup {
  model = 'claude-haiku-5.5',
  prompts = {
    Commit = require 'prompts.git_commit',
    Angular = require 'prompts.angular',
    numpydoc = require 'prompts.numpydoc',
    cleancode = require 'prompts.clean_code',
  },
}

kmset('i', '<C-e>', 'copilot#Accept("<CR>")', { expr = true, silent = true, script = true })
kmset('i', '<C-d>', 'copilot#Dismiss()', { expr = true, silent = true, script = true })
kmset('i', '<C-L>', '<Plug>(copilot-accept-word)')
kmset('n', '<leader>kc', '<CMD>CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat', silent = true })

------------------------------
-- Treesitter support
------------------------------
ghadd 'nvim-treesitter/nvim-treesitter'
require('nvim-treesitter').setup {
  ensure_installed = { 'c', 'cpp', 'lua', 'python', 'typescript', 'javascript', 'html', 'css', 'json', 'rust' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'html', 'htmlangular', 'typescript' },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldenable = false
    vim.wo.foldmethod = 'expr'
    -- -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

------------------------------
-- opencode support
------------------------------
vim.pack.add {
  {
    src = 'https://github.com/nickjvandyke/opencode.nvim',
    -- Defaults to "main", supporting OpenCode v2.
    -- Uncomment to pull the latest stable release, supporting OpenCode v1.
    -- version = vim.version.range("*"),
  },
}

---@type opencode.Opts
vim.g.opencode_opts = {
  -- Your configuration, if any; goto definition on the type for details
}

-- Recommended/example keymaps
vim.keymap.set({ 'n', 'x' }, '<leader>oca', function()
  require('opencode').ask '@this: '
end, { desc = 'Ask OpenCode…' })
vim.keymap.set({ 'n', 'x' }, '<C-x>', function()
  require('opencode').select()
end, { desc = 'Select OpenCode…' })
vim.keymap.set({ 'n', 'x' }, 'go', function()
  return require('opencode').operator '@this'
end, { desc = 'Send range to OpenCode', expr = true })
vim.keymap.set({ 'n' }, 'goo', function()
  return require('opencode').operator '@this' .. '_'
end, { desc = 'Send line to OpenCode', expr = true })
