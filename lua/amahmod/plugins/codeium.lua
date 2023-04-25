return {
    'Exafunction/codeium.vim',
    event = 'InsertEnter',
    config = function()
        local map = vim.keymap.set
        vim.g.codeium_disable_bindings = 1

        map('i', '<C-j>', function()
            return vim.fn['codeium#Accept']()
        end, { expr = true })

        -- map('i', '<C-h>', function()
        --     return vim.fn['codeium#CycleCompletions'](2)
        -- end, { expr = true })
        --
        -- map('i', '<C-l>', function()
        --     return vim.fn['codeium#CycleCompletions'](-1)
        -- end, { expr = true })

        map('i', '<C-p>', function()
            return vim.fn['codeium#Clear']()
        end, { expr = true })
        -- vim.keymap.set("i", "<C-k>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
    end,
}
