vim.keymap.set({ 'n', 'v' }, 'gCc', ':CommentBanner<CR>', { desc = 'Banner text' })
vim.keymap.set({ 'n', 'v' }, 'gCC', ':CommentBanner --comment true<CR>', { desc = 'Banner text (comment)' })
