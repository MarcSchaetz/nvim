return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }
    require('mini.diff').setup {
      view = {
        style = 'sign',
        signs = {
          add = '▎',
          change = '▎',
          delete = '',
        },
      },
    }
  end,
}

