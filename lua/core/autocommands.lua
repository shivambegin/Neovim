local fn = vim.fn

vim.api.nvim_create_augroup('bufcheck', {clear = true})

-- Format on save
vim.api.nvim_create_autocmd(
  'BufWritePre',
  {group = 'bufcheck', pattern = '*', callback = function() vim.lsp.buf.formatting_seq_sync(nil, 5000) end}
)

-- highlight yanks
vim.api.nvim_create_autocmd(
  'TextYankPost', {group = 'bufcheck', pattern = '*', callback = function() vim.highlight.on_yank {timeout = 500} end}
)

-- start terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {group = 'bufcheck', pattern = '*', command = 'startinsert | set winfixheight'})

-- Strip trailing whitespaces on save
vim.api.nvim_create_autocmd('BufWritePre', {group = 'bufcheck', pattern = '*', command = '%s/\\s\\+$//e'})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd(
  'BufReadPost', {
    group = 'bufcheck',
    desc = 'Return to last edit position when opening files',
    pattern = '*',
    callback = function()
      local ft = vim.opt_local.filetype:get()
      -- don't apply to git messages
      if (ft:match('commit') or ft:match('rebase')) then return end
      -- get position of last saved edit
      local markpos = vim.api.nvim_buf_get_mark(0, '"')
      local line = markpos[1]
      local col = markpos[2]
      -- if in range, go there
      if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then vim.api.nvim_win_set_cursor(0, {line, col}) end
    end,
  }
)
