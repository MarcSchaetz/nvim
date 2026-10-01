local servers = {
  'lua_ls',
  'clangd',
  'ts_ls',
  'basedpyright',
  'angularls',
  'emmet_ls',
  'tailwindcss',
  --   'rust_analyzer',
  'jsonls',
  --   'vacuum',
}

vim.diagnostic.config {
  virtual_text = true,
}

vim.lsp.enable(servers)

for _, server in ipairs(servers) do
  local c = vim.lsp.config[server].capabilities
  vim.lsp.config[server].capabilities = require('blink.cmp').get_lsp_capabilities(c)
  if server == 'clangd' then
    vim.lsp.config.clangd.cmd = {
      'clangd',
      '--background-index',
      '--clang-tidy',
      '--header-insertion=iwyu',
      '--completion-style=detailed',
      '--function-arg-placeholders=1',
      '--fallback-style=llvm',
      '--log=error',
    }
  end
end

