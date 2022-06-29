local M = {}
M.setup = function(on_attach, capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.emmet_ls.setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
    root_dir = function()
      return vim.loop.cwd()
    end,
  }
end

return M
