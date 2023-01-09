return {
    -- better vim.notify
    {
        'rcarriga/nvim-notify',
        keys = {
            {
                '<leader>nd',
                function()
                    require('notify').dismiss { silent = true, pending = true }
                end,
                desc = 'Delete all Notifications',
            },
        },
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        },
    },

    -- better vim.ui
    {
        'stevearc/dressing.nvim',
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require('lazy').load { plugins = { 'dressing.nvim' } }
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require('lazy').load { plugins = { 'dressing.nvim' } }
                return vim.ui.input(...)
            end
        end,
    },

    -- bufferline
    {
        'akinsho/nvim-bufferline.lua',
        event = 'BufAdd',
        opts = {
            options = {
                diagnostics = 'nvim_lsp',
                always_show_bufferline = false,
                diagnostics_indicator = function(_, _, diag)
                    local icons =
                        require('amahmod.configs.settings').icons.diagnostics
                    local ret = (
                        diag.error and icons.Error .. diag.error .. ' ' or ''
                    )
                        .. (diag.warning and icons.Warn .. diag.warning or '')
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'Neo-tree',
                        highlight = 'Directory',
                        text_align = 'left',
                    },
                },
            },
        },
    },

    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = function(plugin)
            if plugin.override then
                require('amahmod.util').deprecate(
                    'lualine.override',
                    'lualine.opts'
                )
            end

            local icons = require('amahmod.configs.settings').icons

            local function fg(name)
                return function()
                    ---@type {foreground?:number}?
                    local hl = vim.api.nvim_get_hl_by_name(name, true)
                    return hl
                        and hl.foreground
                        and { fg = string.format('#%06x', hl.foreground) }
                end
            end

            return {
                options = {
                    theme = 'auto',
                    globalstatus = true,
                    disabled_filetypes = {
                        statusline = { 'dashboard', 'lazy', 'alpha' },
                    },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch' },
                    lualine_c = {
                        {
                            'diagnostics',
                            symbols = {
                                error = icons.diagnostics.Error,
                                warn = icons.diagnostics.Warn,
                                info = icons.diagnostics.Info,
                                hint = icons.diagnostics.Hint,
                            },
                        },
                        {
                            'filetype',
                            icon_only = true,
                            separator = '',
                            padding = { left = 1, right = 0 },
                        },
                        {
                            'filename',
                            path = 1,
                            symbols = {
                                modified = '  ',
                                readonly = '',
                                unnamed = '',
                            },
                        },
        -- stylua: ignore
        {
          function() return require("nvim-navic").get_location() end,
          cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
        },
                    },
                    lualine_x = {
        -- stylua: ignore
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = fg("Statement")
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = fg("Constant") ,
        },
                        {
                            require('lazy.status').updates,
                            cond = require('lazy.status').has_updates,
                            color = fg 'Special',
                        },
                        {
                            'diff',
                            symbols = {
                                added = icons.git.added,
                                modified = icons.git.modified,
                                removed = icons.git.removed,
                            },
                        },
                    },
                    lualine_y = {
                        {
                            'progress',
                            separator = '',
                            padding = { left = 1, right = 0 },
                        },
                        { 'location', padding = { left = 0, right = 1 } },
                    },
                    lualine_z = {
                        function()
                            return ' ' .. os.date '%R'
                        end,
                    },
                },
                extensions = { 'nvim-tree' },
            }
        end,
    },

    -- indent guides for Neovim
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufReadPre',
        opts = {
            -- char = "▏",
            char = '│',
            filetype_exclude = {
                'help',
                'alpha',
                'dashboard',
                'neo-tree',
                'Trouble',
                'lazy',
            },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },

    -- active indent guide and indent text objects
    {
        'echasnovski/mini.indentscope',
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = 'BufReadPre',
        opts = {
            -- symbol = "▏",
            symbol = '│',
            options = { try_as_border = true },
        },
        config = function(_, opts)
            vim.api.nvim_create_autocmd('FileType', {
                pattern = {
                    'help',
                    'alpha',
                    'dashboard',
                    'neo-tree',
                    'Trouble',
                    'lazy',
                    'mason',
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
            require('mini.indentscope').setup(opts)
        end,
    },

    -- icons
    'nvim-tree/nvim-web-devicons',

    -- ui components
    'MunifTanjim/nui.nvim',
}
