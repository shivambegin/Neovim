local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require 'lspconfig'
    lspconfig.denols.setup {
        on_attach = on_attach,
        flags = { debounce_text_changes = 150 },
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
        init_options = {
            enable = true,
            lint = true,
            unstable = true,
        },
    }
end

return M
