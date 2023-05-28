local mason = require 'amahmod.plugins.lsp.mason'
local null_ls = require 'amahmod.plugins.lsp.null-ls'
local lspconfig = require 'amahmod.plugins.lsp.lspconfig'
local lsp_lense = require 'amahmod.plugins.lsp.lsp-lense'
local lsp_inlayhints = require 'amahmod.plugins.lsp.lsp-inlayhints'

return {
    mason,
    null_ls,
    lspconfig,
    lsp_lense,
    lsp_inlayhints,
}
