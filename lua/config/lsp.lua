local servers = {
  'lua_ls',
  'clangd',
  'ts_ls',
  'basedpyright',
  'angularls',
  'emmet_ls',
  'tailwindcss',
}

vim.diagnostic.config {
  virtual_text = true,
}

vim.lsp.enable(servers)

for _, server in ipairs(servers) do
  local c = vim.lsp.config[server].capabilities
  vim.lsp.config[server].capabilities = require('blink.cmp').get_lsp_capabilities(c)
end

vim.schedule(function()
  local fl = require 'fzf-lua'
  vim.lsp.buf.references = fl.lsp_references
  vim.lsp.buf.definition = fl.lsp_definitions
  vim.lsp.buf.implementation = fl.lsp_implementations
  vim.lsp.buf.type_definition = fl.lsp_typedefs
  vim.lsp.buf.declaration = fl.lsp_declarations
end)
