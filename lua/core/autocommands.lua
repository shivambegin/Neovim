local create_augroups = function(tbl)
  for group_name, definition in pairs(tbl) do
    vim.api.nvim_command('augroup ' .. group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten({'autocmd', def}), ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

local autocmds = {
  highlight = {{'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'}},
  format = {{'BufWritePre', '*', 'lua vim.lsp.buf.formatting_sync(nil,1000)'}},
  auto_resize = {{'VimResized', '*', 'tabdo wincmd ='}},
  bufs = {{'BufWritePre', 'COMMIT_EDITMSG', 'setlocal noundofile'}, {'BufWritePre', 'MERGE_MSG', 'setlocal noundofile'}},
  filetypes = {
    {'BufNewFile,BufRead', '*.toml', ' setf toml'},
    {'BufNewFile,BufRead', '.prettierrc', ' setf json'},
    {'BufNewFile,BufRead', '.eslintrc', ' setf json'},
    {'BufNewFile,BufRead', '.eslintignore', ' setf gitignore'},
    {'FileType', 'gitcommit', 'set spell'},
    {'FileType', 'gitcommit', 'set wrap'},
    {'FileType', 'markdown', 'set spell'},
    {'FileType', 'markdown', 'set wrap'},
  },
}

create_augroups(autocmds)
