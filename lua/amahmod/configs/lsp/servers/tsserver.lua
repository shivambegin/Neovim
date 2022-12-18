local M = {}

M.setup = function(on_attach, capabilities)
    local lspconfig = require 'lspconfig'

    lspconfig.tsserver.setup {
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern 'package.json',
    }
end

return M
