-- Winbar component using lsp
return {
    -- Navic
    {
        'SmiteshP/nvim-navic', -- statusline/winbar component using lsp
        dependencies = 'neovim/nvim-lspconfig',
        opts = {
            highlight = true,
            separator = ' 〉',
            -- VScode-like icons
            icons = {
                File = ' ',
                Module = ' ',
                Namespace = ' ',
                Package = ' ',
                Class = ' ',
                Method = ' ',
                Property = ' ',
                Field = ' ',
                Constructor = ' ',
                Enum = ' ',
                Interface = ' ',
                Function = ' ',
                Variable = ' ',
                Constant = ' ',
                String = ' ',
                Number = ' ',
                Boolean = ' ',
                Array = ' ',
                Object = ' ',
                Key = ' ',
                Null = ' ',
                EnumMember = ' ',
                Struct = ' ',
                Event = ' ',
                Operator = ' ',
                TypeParameter = ' ',
            },
            lsp = {
                auto_attach = true,
            }
        },
    },
  }
