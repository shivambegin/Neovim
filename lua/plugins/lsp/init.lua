local mason = require 'plugins.lsp.mason'
local lspconfig = require 'plugins.lsp.lspconfig'
-- local null_ls = require 'plugins.lsp.null-ls'
local auto_save = require 'plugins.lsp.auto_save'
local noice = require 'plugins.lsp.noice'
local conform_nvim = require 'plugins.lsp.conform_nvim'
local nvim_lint = require 'plugins.lsp.nvim_lint'
-- local lspsaga = require 'plugins.lsp.lspsaga'

return {
    mason,
    lspconfig,
    -- null_ls,
    auto_save,
    noice,
    conform_nvim,
    nvim_lint,
    -- lspsaga
}
