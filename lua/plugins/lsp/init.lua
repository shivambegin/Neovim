local mason = require 'plugins.lsp.mason'
local lspconfig = require 'plugins.lsp.lspconfig'
local auto_save = require 'plugins.lsp.auto_save'
local noice = require 'plugins.lsp.noice'
local nonels = require 'plugins.lsp.none-ls'
local lspsaga = require 'plugins.lsp.lspsaga'


return {
    mason,
    lspconfig,
    auto_save,
    noice,
    nonels,
    lspsaga,}
