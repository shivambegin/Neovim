return {
    {
        'lvimuser/lsp-inlayhints.nvim',
        event = 'BufReadPre',
        config = function()
            require('lsp-inlayhints').setup {
                show_parameter_hints = true,
                show_parameter_hints_prefix = ' ',
                parameter_hints_prefix = '<- ',
                show_chaining_hints = true,
                show_chaining_hints_prefix = ' ',
                chaining_hints_prefix = '-> ',
                show_type_hints = true,
                show_type_hints_prefix = ' ',
                type_hints_prefix = ': ',
                max_len_align = false,
                max_len_align_padding = 1,
                right_align = false,
                right_align_padding = 7,
            }

            require('amahmod.util').on_attach(function(client, buffer)
                require('lsp-inlayhints').on_attach(client, buffer)
            end)
        end,
        keys = {
            {
                '<leader>tih',
                function()
                    require('lsp-inlayhints').toggle()
                end,
                desc = '[T]oggle [i]nlay [h]ints',
            },
            {
                '<leader>rih',
                function()
                    require('lsp-inlayhints').reset()
                end,
                desc = '[r]eset [i]nlay [h]ints',
            },
        },
    },
}
