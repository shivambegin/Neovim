local M = {}

local icons = require 'amahmod.core.icons'

function M.config()
    local cmp_status_ok, cmp = pcall(require, 'cmp')
    if not cmp_status_ok then
        return
    end

    local _, luasnip = pcall(require, 'luasnip')
    local loader_avail, loader = pcall(require, 'luasnip/loaders/from_vscode')
    if loader_avail then
        loader.lazy_load()
    end

    local check_backspace = function()
        local col = vim.fn.col '.' - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
    end

    vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
    vim.api.nvim_set_hl(0, 'CmpItemKindTabnine', { fg = '#CA42F0' })
    vim.api.nvim_set_hl(0, 'CmpItemKindEmoji', { fg = '#FDE030' })

    cmp.setup {
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ['<C-e>'] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ['<CR>'] = cmp.mapping.confirm { select = false },
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.jumpable(1) then
                    luasnip.jump(1)
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif check_backspace() then
                    -- cmp.complete()
                    fallback()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            format = function(entry, vim_item)
                if entry.source.name == 'copilot' then
                    vim_item.kind = '[] Copilot'
                    vim_item.kind_hl_group = 'CmpItemKindCopilot'
                    return vim_item
                end
                -- Kind icons
                vim_item.kind = string.format('%s', icons.kind[vim_item.kind])
                -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                vim_item.menu = ({
                    nvim_lsp = '[LSP]',
                    nvim_lua = '[NVIM_LUA]',
                    luasnip = '[Snippet]',
                    buffer = '[Buffer]',
                    path = '[Path]',
                })[entry.source.name]
                return vim_item
            end,
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        experimental = { ghost_text = true, native_menu = false },
    }

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources {
            { name = 'conventionalcommits' },
            { name = 'cmp_git' },
            { name = 'buffer' },
        },
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        sources = cmp.config.sources { { name = 'buffer' } },
        mapping = cmp.mapping.preset.cmdline(),
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
            { name = 'path' },
            { name = 'cmdline' },
        },
    })
end

return M
