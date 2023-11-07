-- Show project outline
return {
    'simrat39/symbols-outline.nvim', -- show symbols of the current buffer
    config = function()
        --- Return with with minimum threshold
        local width_with_min = function(ratio, min_width)
            local width = math.floor(vim.go.columns * ratio)
            width = math.max(width, min_width)
            return width
        end

        require('symbols-outline').setup({
            relative_width = false,
            width = width_with_min(0.15, 50),
            autofold_depth = 1,
            symbols = {
                File = { icon = '', hl = '@text.uri' },
                Module = { icon = '', hl = '@namespace' },
                Namespace = { icon = '', hl = '@namespace' },
                Package = { icon = '', hl = '@namespace' },
                Class = { icon = '', hl = '@type' },
                Method = { icon = '', hl = '@method' },
                Property = { icon = '', hl = '@method' },
                Field = { icon = '', hl = '@field' },
                Constructor = { icon = '', hl = '@constructor' },
                Enum = { icon = '', hl = '@type' },
                Interface = { icon = '', hl = '@type' },
                Function = { icon = '', hl = '@function' },
                Variable = { icon = '', hl = '@constant' },
                Constant = { icon = '', hl = '@constant' },
                String = { icon = '', hl = '@string' },
                Number = { icon = '', hl = '@number' },
                Boolean = { icon = '', hl = '@boolean' },
                Array = { icon = '', hl = '@constant' },
                Object = { icon = '', hl = '@type' },
                Key = { icon = '', hl = '@type' },
                Null = { icon = '', hl = '@type' },
                EnumMember = { icon = '', hl = '@field' },
                Struct = { icon = '', hl = '@type' },
                Event = { icon = '', hl = '@type' },
                Operator = { icon = '', hl = '@operator' },
                TypeParameter = { icon = '', hl = '@parameter' },
                Component = { icon = '', hl = '@function' },
                Fragment = { icon = '', hl = '@constant' },
            },
        })
    end,
}
