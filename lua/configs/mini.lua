local map = vim.keymap.set

require('mini.ai').setup() -- create textobjects
require('mini.bufremove').setup() -- remove buffer without affecting layout
require('mini.indentscope').setup() -- Visualize and operate on indent scope
require('mini.surround').setup() -- Fast and feature-rich surround plugin
require('mini.align').setup() -- aling text
require('mini.comment').setup() -- comment / uncomment
require('mini.pairs').setup() -- auto create pairs

map('n', '<leader>x', require('mini.bufremove').delete, { desc = 'Close current buffer' })
