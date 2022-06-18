local M = {}
M.setup = function(on_attach, capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.eslint.setup {
    on_attach = on_attach,
    flags = {debounce_text_changes = 150},
    capabilities = capabilities,
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'vue',
      'svelte',
    },

  }
end

return M
