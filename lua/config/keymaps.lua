-- This is going to get me cancelled(primegen inspired : )
vim.keymap.set("i", "<C-c>", "<Esc>")
-- General {{{
--
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format)
--utility vim.keymap.setpings
vim.keymap.set("n", "n", "nzzzv") -- keep the cursor centered when doing 'n'
vim.keymap.set("n", "N", "Nzzzv") -- keep the cursor centered when doing 'N'
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line without moving the cursor" })
vim.keymap.set("n", "cn", "*``cgn", { desc = "Change next match by pressing dot (.)" })
vim.keymap.set("n", "cN", "*``cgN", { desc = "Change previous match by pressing dot (.)" })
vim.keymap.set("n", "<leader>vp", "`[v`]<CR>", { desc = "Select pasted text" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
vim.keymap.set(
  "n",
  "<leader>z",
  ":%s/<C-R><C-W>/<C-R>0/g<CR>",
  { desc = 'Replace word under cursor with register "0" content globally' }
)

vim.keymap.set("n", "<leader>ts", "<cmd>set spell!<CR>", { desc = "Toggle spell check" })
vim.keymap.set("n", "<leader>th", "<cmd>set hlsearch!<CR>", { desc = "Toggle highlights (hlsearch)" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

vim.keymap.set({ "i" }, "<C-l>", "<Right>", { desc = "Move cursor to right" })
vim.keymap.set({ "i" }, "<C-h>", "<Left>", { desc = "Move cursor to right" })

-- }}}

-- Better window management {{{

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })
-- }}}

-- save and quit {{{

vim.keymap.set("n", "<leader>Q", "<cmd>wq!<CR>", { desc = "Force save and  quit" })
-- }}}

-- Buffers {{{

vim.keymap.set("n", "<leader>ba", "<cmd>bufdo bd<CR>", { desc = "close all buffers" })
vim.keymap.set(
  "n",
  "<leader>bo",
  "<cmd>w <bar> %bd <bar> e# <bar> bd#<CR>",
  { desc = "Close all buffers except current one" }
)
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Close buffer/window" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })

-- }}}

-- Tabs {{{

vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "]t", ":tabnext<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "[t", ":tabprevious<CR>", { desc = "Go to previous tab" })
-- }}}

-- Visual {{{

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "(V) Indent to left" })
vim.keymap.set("v", ">", ">gv", { desc = "(V) Indent to right" })
-- }}}

vim.keymap.set("n", "<Leader>lo", "<cmd>lopen<CR>", { desc = "Open location list" })
vim.keymap.set("n", "<Leader>lc", "<cmd>lclose<CR>", { desc = "Close location list" })
vim.keymap.set("n", "<Leader>ln", "<cmd>lnext<CR>", { desc = "Next location list item" })
vim.keymap.set("n", "<Leader>lp", "<cmd>lprev<CR>", { desc = "Previous location list item" })
-- }}}

-- vim:fdm=marker:fdl=0

vim.keymap.set("n", "<leader>la", "<cmd>Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>ma", "<cmd>Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "<leader>ch", "<cmd>checkhealth<CR>", { desc = "checkhealth" })
vim.keymap.set("n", "<leader>ee", "<cmd>E<CR>", { desc = "netrw" })
-- Visual vim.keymap.sets
vim.keymap.set("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words
vim.keymap.set("v", "<C-s>", ":sort<CR>") -- Sort highlighted text in visual mode with Control+S
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- Move current line up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move current line down
