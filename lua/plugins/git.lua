return {
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            signs = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '契' },
                topdelete = { text = '契' },
                changedelete = { text = '▎' },
                untracked = { text = '▎' },
            },
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                -- stylua: ignore start
                map("n", "]c", gs.next_hunk, "Next Hunk")
                map("n", "[c", gs.prev_hunk, "Prev Hunk")
                -- Actions
                map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
                map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
                map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
                map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
                map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
                map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
                map("n", "<leader>hb", function()
                    gs.blame_line { full = true }
                end, { desc = "Blame Line" })
                map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle Line Blame" })
                map("n", "<leader>hd", gs.diffthis, { desc = "Diff This" })
                map("n", "<leader>hD", function()
                    gs.diffthis "~"
                end, { desc = "Diff This ~" })
                map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle Delete" })

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
            end,
        },
    },
    {
        'tpope/vim-fugitive',
        cmd = {
            'G',
            'Git',
            'Gdiff',
            'Gclog',
            'Ggrep',
            'Gread',
            'Gwrite',
            'GDelete',
            'GBrowser',
            'Gdiffsplit',
            'Gvdiffsplit',
            'Gfetch',
            'Gfetch',
        },
        keys = {
            { '<leader>gg', '<cmd>Git<cr>', desc = 'Git status' },
        },
    },
}
