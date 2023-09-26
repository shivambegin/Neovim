local mason = require 'plugins.lsp.mason'
local lspconfig = require 'plugins.lsp.lspconfig'
local null_ls = require 'plugins.lsp.null-ls'
local auto_save = require 'plugins.lsp.auto_save'
return {
    mason,
    lspconfig,
    null_ls,
    auto_save,
}
