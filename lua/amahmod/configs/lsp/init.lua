local status_ok, mason = pcall(require, 'mason')
local lspconfig = require 'lspconfig'

if not status_ok then
    return
end

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

local define_signs = function()
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

    vim.diagnostic.config {
        virtual_text = { source = 'always', prefix = ' ', spacing = 6 },
        float = { header = false, source = 'always' },
        signs = true,
        underline = true,
        update_in_insert = false,
    }
end

local update_handlers = function()
    vim.lsp.handlers['textDocument/hover'] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
    -- vim.lsp.handlers['textDocument/definition'] = lsp_goto_definition 'split'
end

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

local on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = 'Format current buffer with LSP' })

    client.server_capabilities.document_formatting = false

    if client.name == 'null-ls' then
        client.server_capabilities.document_formatting = true
    end
    if client.name == 'eslint' then
        client.server_capabilities.document_formatting = true
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap(
        'gr',
        require('telescope.builtin').lsp_references,
        '[G]oto [R]eferences'
    )
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap(
        '<leader>ds',
        require('telescope.builtin').lsp_document_symbols,
        '[D]ocument [S]ymbols'
    )
    nmap(
        '<leader>ws',
        require('telescope.builtin').lsp_dynamic_workspace_symbols,
        '[W]orkspace [S]ymbols'
    )

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, {
        buffer = bufnr,
        desc = 'Signature Documentation',
    })
    nmap('<leader>lf', ':Format<CR>', '[G]oto [D]eclaration')
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

define_signs()
update_handlers()
mason.setup()

require('mason-lspconfig').setup {
    ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
        },
    },
}

lspconfig.denols.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
    init_options = {
        enable = true,
        lint = true,
        unstable = true,
    },
}
