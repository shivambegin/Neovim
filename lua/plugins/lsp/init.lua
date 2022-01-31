local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then return end

require('plugins.lsp.lsp-installer')
require('plugins.lsp.handlers')
require('plugins.lsp.null-ls')
