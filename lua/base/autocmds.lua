local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

--  ╭──────────────────────────────────────────────────────────╮
--  │   Check if we need to reload the file when it changed    │
--  ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = augroup 'checktime',
    command = 'checktime',
})

--  ╭──────────────────────────────────────────────────────────╮
--  │                    Highlight on yank                     │
--  ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup 'highlight_yank',
    callback = function()
        vim.highlight.on_yank()
    end,
})

--  ╭──────────────────────────────────────────────────────────╮
--  │           Go to last location when opening a buffer           │
--  ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup 'last_loc',
    callback = function()
        local ft = vim.opt_local.filetype:get()
        -- don't apply to git messages
        if ft:match 'commit' or ft:match 'rebase' then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

--  ╭──────────────────────────────────────────────────────────╮
--  │              Close some filetypes with <q>               │
--  ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('FileType', {
    group = augroup 'close_with_q',
    pattern = {
        'qf',
        'help',
        'man',
        'notify',
        'lspinfo',
        'spectre_panel',
        'startuptime',
        'tsplayground',
        'PlenaryTestPopup',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set(
            'n',
            'q',
            '<cmd>close<cr>',
            { buffer = event.buf, silent = true }
        )
    end,
})

--  ╭──────────────────────────────────────────────────────────╮
--  │          Auto create intermediary direcotories           │
--  ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = augroup 'auto_create_dir',
    callback = function(event)
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})
