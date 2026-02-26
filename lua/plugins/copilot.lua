return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'gptlang/lua-tiktoken' },
    { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
    { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    { 'github/copilot.vim',
      -- add options here
      config = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
      end,
    }
  },
  build = 'make tiktoken', -- Only on MacOS or Linux
  opts = {
    -- add a new prompt for the chat that creates a git commit message in conventional commit format for the staged files
    prompts = {
      Commit = require 'prompts.git_commit',
      Angular = require 'prompts.angular',
    },

    -- See Configuration section for options
  },
  -- See Commands section for default commands if you want to lazy load on them
}

