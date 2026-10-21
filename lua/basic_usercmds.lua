-- Creates a user command :FoldMarker to configure buffer-local folding.
-- Usage: :FoldMarker
-- Sets foldmethod to "marker" and foldmarker to the pair "{{{" and "}}}".
-- This makes folds defined by {{{ ... }}} markers in the current buffer.
vim.api.nvim_create_user_command('FoldMarker', function()
  vim.opt_local.foldmethod = 'marker'
  vim.opt_local.foldmarker = { '{{{', '}}}' }
end, { desc = 'Set folding to marker method with {{{ }}} markers' })

--- Sets buffer-local folding method to "marker" and configures the fold markers
--- to use `#region` and `#endregion`.
--- Usage:  :FoldRegion
--- Effect: Sets `vim.opt_local.foldmethod = 'marker'` and `vim.opt_local.foldmarker = { '#region', '#endregion' }`.
vim.api.nvim_create_user_command('FoldRegion', function()
  vim.opt_local.foldmethod = 'marker'
  vim.opt_local.foldmarker = { '#region', '#endregion' }
end, { desc = 'Set folding to marker method with #region #endregion markers' })

--- Sets buffer-local folding method to "indent" and clears the fold markers.
--- Usage:  :FoldIndent
--- Effect: Sets `vim.opt_local.foldmethod = 'indent'` and clears `vim.opt_local.foldmarker`.
vim.api.nvim_create_user_command('FoldIndent', function()
  vim.opt_local.foldmethod = 'indent'
  vim.opt_local.foldmarker = nil
end, { desc = 'Set folding to indent method' })

--- Disables automatic marker folding for the current buffer by switching to
--- manual fold method and clearing the fold markers.
--- Usage:  :FoldNone
--- Effect: Sets `vim.opt_local.foldmethod = 'manual'` and clears `vim.opt_local.foldmarker`.
vim.api.nvim_create_user_command('FoldNone', function()
  vim.opt_local.foldmethod = 'manual'
  vim.opt_local.foldmarker = nil
end, { desc = 'Unset Folding' })
