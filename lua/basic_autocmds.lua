-- ******************************
--
-- 		 Basic autocmds
--
-- ******************************
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    local color = '#99a1af'
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = color })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = color })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = color })
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_user_command('VimPackInfo', function()
  vim.pack.update(nil, { offline = true })
end, { desc = '' })

vim.api.nvim_create_user_command('VimPackUpdate', function()
  vim.pack.update(nil, { force = true })
end, { desc = '' })

local oldHighlight = vim.api.nvim_get_hl(0, { name = 'LineNrAbove' })
vim.api.nvim_create_autocmd('ModeChanged', {
  callback = function()
    local ins = vim.api.nvim_get_hl(0, { name = 'MiniStatuslineModeInsert' })
    local repl = vim.api.nvim_get_hl(0, { name = 'MiniStatuslineModeReplace' })
    local visu = vim.api.nvim_get_hl(0, { name = 'MiniStatuslineModeVisual' })
    if vim.fn.mode() == 'i' then
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = ins.bg })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = ins.bg })
    elseif string.match(vim.fn.mode(), '^[vV\x16]') then
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = visu.bg })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = visu.bg })
    elseif vim.fn.mode() == 'R' then
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = repl.bg })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = repl.bg })
    else
      vim.api.nvim_set_hl(0, 'LineNrAbove', oldHighlight)
      vim.api.nvim_set_hl(0, 'LineNrBelow', oldHighlight)
    end
  end,
})
