local M = {}
local colors = require 'amahmod.core.colors'

local function lsp_highlight_document(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
    hi! LspReferenceRead cterm=bold ctermbg=red guibg=#787e87
    hi! LspReferenceText cterm=bold ctermbg=red guibg=#787e87
    hi! LspReferenceWrite cterm=bold ctermbg=red guibg=#787e87
  ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
        vim.api.nvim_clear_autocmds {
            buffer = bufnr,
            group = 'lsp_document_highlight',
        }
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

local function lsp_goto_definition(split_cmd)
    local util = vim.lsp.util
    local log = require 'vim.lsp.log'
    local api = vim.api

    -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
    local handler = function(_, result, ctx)
        if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(ctx.method, 'No location found')
            return nil
        end

        if split_cmd then
            vim.cmd(split_cmd)
        end

        if vim.tbl_islist(result) then
            util.jump_to_location(result[1])

            if #result > 1 then
                util.set_qflist(util.locations_to_items(result))
                api.nvim_command 'copen'
                api.nvim_command 'wincmd p'
            end
        else
            util.jump_to_location(result)
        end
    end

    return handler
end

function M.lsp_set_signs()
    local signs = {
        { name = 'DiagnosticSignError', text = '' },
        { name = 'DiagnosticSignWarn', text = '' },
        { name = 'DiagnosticSignHint', text = '' },
        { name = 'DiagnosticSignInfo', text = '' },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(
            sign.name,
            { texthl = sign.name, text = sign.text, numhl = '' }
        )
    end

    ---custom namespace
    local ns = vim.api.nvim_create_namespace 'severe-diagnostics'

    ---reference to the original handler
    local orig_signs_handler = vim.diagnostic.handlers.signs

    ---Overriden diagnostics signs helper to only show the single most relevant sign
    ---@see `:h diagnostic-handlers`
    vim.diagnostic.handlers.signs = {
        show = function(_, bufnr, _, opts)
            -- get all diagnostics from the whole buffer rather
            -- than just the diagnostics passed to the handler
            local diagnostics = vim.diagnostic.get(bufnr)

            local filtered_diagnostics =
            require('amahmod.core.utils').filter_diagnostics(diagnostics)

            -- pass the filtered diagnostics (with the
            -- custom namespace) to the original handler
            orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
        end,

        hide = function(_, bufnr)
            orig_signs_handler.hide(ns, bufnr)
        end,
    }
end

function M.lsp_set_handlers()
    vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
    -- vim.lsp.handlers['textDocument/definition'] = lsp_goto_definition 'split'
end

function M.lsp_set_diagnostic()
    -- Prefix diagnostic virtual text
    vim.diagnostic.config {
        virtual_text = { source = 'always', prefix = ' ', spacing = 6 },
        float = { header = false, source = 'always' },
        signs = true,
        underline = true,
        update_in_insert = false,
    }
end

function M.on_attach(client, bufnr)
    client.server_capabilities.document_formatting = false

    if client.name == 'null-ls' then
        client.server_capabilities.document_formatting = true
    end
    if client.name == 'eslint' then
        client.server_capabilities.document_formatting = true
    end

    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_create_user_command('Format', function()
        vim.lsp.buf.format()
    end, {})

    lsp_highlight_document(client, bufnr)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.documentationFormat =
{ 'markdown', 'plaintext' }
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.preselectSupport = true
M.capabilities.textDocument.completion.completionItem.insertReplaceSupport =
true
M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
M.capabilities.textDocument.completion.completionItem.commitCharactersSupport =
true
M.capabilities.textDocument.completion.completionItem.tagSupport =
{ valueSet = { 1 } }
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { 'documentation', 'detail', 'additionalTextEdits' },
}

return M
