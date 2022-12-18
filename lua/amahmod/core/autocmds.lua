local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local custom_group = augroup('ThePrimeagen', { clear = true })
local yank_group = augroup('HighlightYank', { clear = true })

-- Format on save
-- autocmd('BufWritePre', {
--   group = custom_group,
--   pattern = '*',
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })

-- highlight yanks
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { timeout = 100, higroup = 'IncSearch' }
    end,
})

-- start terminal in insert mode
autocmd('TermOpen', {
    group = custom_group,
    pattern = '*',
    command = 'startinsert | set winfixheight',
})

-- Strip trailing whitespaces on save
autocmd(
    'BufWritePre',
    { group = custom_group, pattern = '*', command = '%s/\\s\\+$//e' }
)

-- Return to last edit position when opening files
autocmd('BufReadPost', {
    group = custom_group,
    desc = 'Return to last edit position when opening files',
    pattern = '*',
    callback = function()
        local ft = vim.opt_local.filetype:get()
        -- don't apply to git messages
        if ft:match 'commit' or ft:match 'rebase' then
            return
        end
        -- get position of last saved edit
        local markpos = vim.api.nvim_buf_get_mark(0, '"')
        local line = markpos[1]
        local col = markpos[2]
        -- if in range, go there
        if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
            vim.api.nvim_win_set_cursor(0, { line, col })
        end
    end,
})

-- Remove tailing whitespaces on save
autocmd({ 'BufWritePre' }, {
    group = custom_group,
    pattern = '*',
    command = '%s/\\s\\+$//e',
})
