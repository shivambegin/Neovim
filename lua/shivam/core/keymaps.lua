local map = vim.keymap.set

-- This is going to get me cancelled(primegen inspired : )
map("i", "<C-c>", "<Esc>")
map("n", "<leader>f", vim.lsp.buf.format)
-- General {{{
--
map("n", "<leader>ex", vim.cmd.Ex)
map("n", "<leader><leader>", function()
  vim.cmd("so")
end)
map("n", "<leader>fo", vim.lsp.buf.format)
--utility mappings
map("n", "n", "nzzzv") -- keep the cursor centered when doing 'n'
map("n", "N", "Nzzzv") -- keep the cursor centered when doing 'N'
map("n", "J", "mzJ`z", { desc = "Join line without moving the cursor" })
map("n", "cn", "*``cgn", { desc = "Change next match by pressing dot (.)" })
map("n", "cN", "*``cgN", { desc = "Change previous match by pressing dot (.)" })
map("n", "<leader>vp", "`[v`]<CR>", { desc = "Select pasted text" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
map(
  "n",
  "<leader>z",
  ":%s/<C-R><C-W>/<C-R>0/g<CR>",
  { desc = 'Replace word under cursor with register "0" content globally' }
)

map("n", "<leader>ts", "<cmd>set spell!<CR>", { desc = "Toggle spell check" })
map("n", "<leader>th", "<cmd>set hlsearch!<CR>", { desc = "Toggle highlights (hlsearch)" })

map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

map({ "i" }, "<C-l>", "<Right>", { desc = "Move cursor to right" })
map({ "i" }, "<C-h>", "<Left>", { desc = "Move cursor to right" })

-- }}}

-- Better window management {{{

map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })
-- }}}

-- save and quit {{{

map("n", "<leader>Q", "<cmd>wq!<CR>", { desc = "Force save and  quit" })
-- }}}

-- Buffers {{{

map("n", "<leader>ba", "<cmd>bufdo bd<CR>", { desc = "close all buffers" })
map("n", "<leader>bo", "<cmd>w <bar> %bd <bar> e# <bar> bd#<CR>", { desc = "Close all buffers except current one" })
map("n", "<leader>q", "<cmd>q!<CR>", { desc = "Close buffer/window" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
map("n", "]b", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
map("n", "[b", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })

-- }}}

-- Tabs {{{

map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "]t", ":tabnext<CR>", { desc = "Go to next tab" })
map("n", "[t", ":tabprevious<CR>", { desc = "Go to previous tab" })
-- }}}

-- Visual {{{

-- Stay in indent mode
map("v", "<", "<gv", { desc = "(V) Indent to left" })
map("v", ">", ">gv", { desc = "(V) Indent to right" })
-- }}}

map("n", "<Leader>lo", "<cmd>lopen<CR>", { desc = "Open location list" })
map("n", "<Leader>lc", "<cmd>lclose<CR>", { desc = "Close location list" })
map("n", "<Leader>ln", "<cmd>lnext<CR>", { desc = "Next location list item" })
map("n", "<Leader>lp", "<cmd>lprev<CR>", { desc = "Previous location list item" })
-- }}}

-- vim:fdm=marker:fdl=0

map("n", "<leader>la", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>ma", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>ch", "<cmd>checkhealth<CR>", { desc = "checkhealth" })
map("n", "<leader>ee", "<cmd>E<CR>", { desc = "netrw" })
-- Visual Maps
map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words
map("v", "<C-s>", ":sort<CR>") -- Sort highlighted text in visual mode with Control+S
map("v", "K", ":m '>-2<CR>gv=gv") -- Move current line up
map("v", "J", ":m '>+1<CR>gv=gv") -- Move current line down
