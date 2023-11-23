-- Git diff signs
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(bufnr)
      -- local gs = package.loaded.gitsigns

      local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
      end
      local opts = { noremap = true, silent = true }

      -- Navigation
      buf_set_keymap("n", "]h", "<cmd>Gitsigns next_hunk<CR>", opts)
      buf_set_keymap("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", opts)
      buf_set_keymap("n", "<leader>h", "<cmd>Gitsigns preview_hunk<CR>", opts)
      buf_set_keymap("n", "<leader>H", "<cmd>Gitsigns preview_hunk_inline<CR>", opts)

      -- Actions
      -- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
      -- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
      -- map('n', '<leader>hS', gs.stage_buffer)
      -- map('n', '<leader>hu', gs.undo_stage_hunk)
      -- map('n', '<leader>hR', gs.reset_buffer)
      -- map('n', '<leader>hp', gs.preview_hunk)
      -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      -- map('n', '<leader>tb', gs.toggle_current_line_blame)
      -- map('n', '<leader>hd', gs.diffthis)
      -- map('n', '<leader>hD', function() gs.diffthis('~') end)
      -- map('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
  },
}
