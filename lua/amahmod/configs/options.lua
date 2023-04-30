local options = {
    opt = {
        -- backspace = vim.opt.backspace + { 'nostop' }, -- Don't stop backspace at insert
        -- clipboard = 'unnamedplus', -- Connection to the system clipboard
        -- colorcolumn = '80',
        -- preserveindent = false, -- Preserve indent structure as much as possible
        autoindent = true,
        cmdheight = 1,
        completeopt = { 'menuone', 'noinsert', 'noselect' }, -- Options for insert mode completion
        conceallevel = 3, -- Hide * markup for bold and italic
        copyindent = true, -- Copy the previous indentation on auto indenting
        cursorline = true, -- Highlight the text line of the cursor
        expandtab = true, -- Use spaces instead of tabs
        fileencoding = 'utf-8', -- File content encoding for the buffer
        fillchars = { eob = ' ' }, -- Disable `~` on nonexistent lines
        foldexpr = 'nvim_treesitter#foldexpr()',
        foldlevel = 3,
        foldlevelstart = 99,
        foldmethod = 'expr',
        formatoptions = 'jcroqlnt',
        grepformat = '%f:%l:%c:%m',
        grepprg = 'rg --vimgrep',
        history = 100, -- Number of commands to remember in a history table
        hlsearch = true,
        ignorecase = true, -- Case insensitive searching
        incsearch = true,
        laststatus = 3, -- global statusline
        lazyredraw = false, -- lazily redraw screen
        list = true, -- Show some invisible characters (tabs, spaces, etc.)
        mouse = 'a', -- Enable mouse support
        number = true, -- Show numberline
        pumblend = 10, -- Popup blend
        pumheight = 10, -- Maximum number of items in the popup menu
        relativenumber = true, -- Show relative numberline
        scrolloff = 8, -- Number of lines to keep above and below the cursor
        shiftround = true, -- Round indent to multiple of shiftwidth
        shiftwidth = 4, -- Number of space inserted for indentation
        showmode = false, -- Disable showing modes in command line
        sidescrolloff = 2, -- Number of columns to keep at the sides of the cursor
        signcolumn = 'yes', -- Always show the sign column
        smartcase = true, -- Case sensitivie searching
        smartindent = true, -- Smart code indentation
        smarttab = true, -- Insert spaces when tab is pressed
        softtabstop = 4, -- Number of space in a tab
        spell = false,
        spelllang = { 'en' },
        splitbelow = true, -- Splitting a new window below the current one
        splitkeep = 'screen',
        splitright = true, -- Splitting a new window at the right of the current one
        swapfile = false, -- Disable use of swapfile for the buffer
        tabstop = 4, -- Number of space in a tab
        termguicolors = true, -- Enable 24-bit RGB color in the TUI
        timeoutlen = 300, -- Length of time to wait for a mapped sequence
        undofile = true, -- Enable persistent undo
        updatetime = 200, -- Length of time to wait before triggering the plugin
        wildmode = 'longest:full,full', -- Command-line completion mode
        winbar = '%m %f', -- Statusline
        winminwidth = 5, -- window minimum width
        wrap = false, -- Disable wrapping of lines longer than the width of window
        writebackup = false, -- Disable making a backup before overwriting a file
    },
}

-- Don't pass messages to |ins-completion-menu|.
vim.g.mapleader = ' '
vim.opt.shortmess:append { W = true }

for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end
