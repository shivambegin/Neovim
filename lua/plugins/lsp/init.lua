local mason = require 'plugins.lsp.mason'
local lspconfig = require 'plugins.lsp.lspconfig'
local auto_save = require 'plugins.lsp.auto_save'
local noice_notify = require 'plugins.lsp.noice_notify'
local nonels = require 'plugins.lsp.none-ls'
local lspsaga = require 'plugins.lsp.lspsaga'
local linting = require 'plugins.lsp.linting'
local illuminate = require 'plugins.lsp.iluminate'


return {
    mason,
    lspconfig,
    auto_save,
    noice_notify,
    nonels,
    lspsaga,
    linting,
    illuminate,
}
