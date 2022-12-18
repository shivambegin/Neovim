local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

local handlers = require 'amahmod.configs.lsp.handlers'

local servers = {
    'sumneko_lua',
    'cssls',
    'html',
    'emmet_ls',
    'jsonls',
    'yamlls',
    'dockerls',
    'tsserver',
    'gopls',
    'diagnosticls',
    'sqlls',
    'svelte',
    'volar',
    'eslint',
    'tailwindcss',
    'graphql',
    'rust_analyzer',
    'marksman',
    'denols',
}

lsp_installer.setup {
    ensure_installed = servers,
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗',
        },
    },
}

for _, server in ipairs(servers) do
    require('amahmod.configs.lsp.servers.' .. server).setup(
        handlers.on_attach,
        handlers.capabilities
    )
end

handlers.lsp_set_signs()
handlers.lsp_set_diagnostic()
handlers.lsp_set_handlers()
