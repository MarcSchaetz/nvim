local gh = function(url)
  return 'https://github.com/' .. url
end

vim.pack.add {
  gh 'nvim-mini/mini.icons',
  gh 'ibhagwan/fzf-lua',
  gh 'stevearc/oil.nvim',
  gh 'nvim-mini/mini.snippets',
  gh 'rafamadriz/friendly-snippets',
  gh 'stevearc/conform.nvim',
  gh 'mason-org/mason.nvim',
  gh 'neovim/nvim-lspconfig',
  gh 'echasnovski/mini.nvim',
  gh 'romus204/tree-sitter-manager.nvim',
  gh 'folke/tokyonight.nvim',
  gh 'gptlang/lua-tiktoken',
  gh 'github/copilot.vim',
  gh 'CopilotC-Nvim/CopilotChat.nvim',
  gh 'folke/todo-comments.nvim',
  { src = gh 'nvim-lua/plenary.nvim', version = 'master' }, -- for curl, log and async functions
  { src = gh 'saghen/blink.cmp', version = vim.version.range '1.10.1' },
}

-- Fzf lua
local fl = require 'fzf-lua'
fl.register_ui_select()
fl.setup {
  winopts = {
    preview = {
      layout = 'vertical',
    },
  },
}

-- Oil
require('oil').setup()

-- Blink cmp
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
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  -- opts_extend = { "sources.default" },
}

-- Conform
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
    python = { 'black' },
    rust = { 'rustfmt' },
  },
}

-- Colorscheme
require('tokyonight').setup {
  on_highlights = function(highlights, colors)
    highlights.LineNrAbove = { fg = colors.fg_dark }
    highlights.LineNr = { fg = colors.orange }
    highlights.LineNrBelow = { fg = colors.fg_dark }
  end,
}

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

require('CopilotChat').setup {
  model = 'claude-haiku-4.5',
  prompts = {
    Commit = require 'prompts.git_commit',
    Angular = require 'prompts.angular',
    numpydoc = require 'prompts.numpydoc',
    cleancode = require 'prompts.clean_code',
  },
}

-- Todo comments
require('todo-comments').setup()

-- Mason
require('mason').setup()

-- Mini
require('mini.icons').setup()
require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }
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

-- Treesitter
require('tree-sitter-manager').setup {
  languages = {
    mustache = {
      install_info = {
        url = 'https://github.com/TheLeoP/tree-sitter-mustache',
        use_repo_queries = true,
      },
    },
  },
}
