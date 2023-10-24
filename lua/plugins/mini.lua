return {
    {
        'echasnovski/mini.pairs',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function(_, opts)
            require('mini.pairs').setup(opts)
        end,
    },
    {
        'echasnovski/mini.bufremove',
        keys = {
            {
                '<leader>x',
                function()
                    require('mini.bufremove').delete(0, false)
                end,
                desc = 'Delete Buffer',
            },
            {
                '<leader>X',
                function()
                    require('mini.bufremove').delete(0, true)
                end,
                desc = 'Delete Buffer (Force)',
            },
        },
    },
    {
        'echasnovski/mini.align',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function(_, opts)
            require('mini.align').setup(opts)
        end,
    },
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { "BufReadPre", "BufNewFile" },
        opts = {
          -- symbol = "▏",
          symbol = "│",
          options = { try_as_border = true },
        },
        init = function()
          vim.api.nvim_create_autocmd("FileType", {
            pattern = {
              "help",
              "alpha",
              "dashboard",
              "neo-tree",
              "Trouble",
              "lazy",
              "mason",
              "notify",
              "toggleterm",
              "lazyterm",
            },
            callback = function()
              vim.b.miniindentscope_disable = true
            end,
          })
        end,
      },
      {
        'echasnovski/mini.comment',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            hooks = {
                pre = function()
                    require('ts_context_commentstring.internal').update_commentstring {}
                end,
            },
        },
        config = function(_, opts)
            require('mini.comment').setup(opts)
        end,
    },
    {
        'LudoPinelli/comment-box.nvim',
        cmd = {
            'CBllbox',
            'CBlcbox',
            'CBlrbox',
            'CBclbox',
            'CBccbox',
            'CBcrbox',
            'CBrlbox',
            'CBrcbox',
            'CBrrbox',
            'CBalbox',
            'CBacbox',
            'CBarbox',
        },
    },
    {
        'folke/todo-comments.nvim',
        cmd = { 'TodoTrouble', 'TodoTelescope' },
        event = { 'BufReadPost', 'BufNewFile' },
        config = true,
    },
    {
        'xorid/asciitree.nvim',
        cmd = 'AsciiTree',
    },
}
