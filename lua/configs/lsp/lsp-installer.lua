local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then return end

lsp_installer.setup {
  ensure_installed = {
    'cssls',
    'diagnosticls',
    'dockerls',
    'eslint',
    'emmet_ls',
    'gopls',
    'graphql',
    'html',
    'jsonls',
    'tsserver',
    'sumneko_lua',
    'rust_analyzer',
    'sqlls',
    'svelte',
    'tailwindcss',
    'volar',
    'yamlls',
  },
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {icons = {server_installed = '✓', server_pending = '➜', server_uninstalled = '✗'}},
}
