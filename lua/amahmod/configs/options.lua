local options = {
    opt = {
        -- backspace = vim.opt.backspace + { 'nostop' }, -- Don't stop backspace at insert
        -- clipboard = 'unnamedplus', -- Connection to the system clipboard
        completeopt = { 'menuone', 'noinsert', 'noselect' }, -- Options for insert mode completion
        copyindent = true, -- Copy the previous indentation on autoindenting
        cursorline = true, -- Highlight the text line of the cursor
        fileencoding = 'utf-8', -- File content encoding for the buffer
        fillchars = { eob = ' ' }, -- Disable `~` on nonexistent lines
        history = 100, -- Number of commands to remember in a history table
        ignorecase = true, -- Case insensitive searching
        laststatus = 3, -- global statusline
        lazyredraw = false, -- lazily redraw screen
        mouse = 'a', -- Enable mouse support
        number = true, -- Show numberline
        -- preserveindent = false, -- Preserve indent structure as much as possible
        -- pumheight = 10, -- Height of the pop up menu
        relativenumber = true, -- Show relative numberline
        scrolloff = 8, -- Number of lines to keep above and below the cursor
        showmode = false, -- Disable showing modes in command line
        sidescrolloff = 2, -- Number of columns to keep at the sides of the cursor
        signcolumn = 'yes', -- Always show the sign column
        smartcase = true, -- Case sensitivie searching
        smartindent = true, -- Smart code indentation
        autoindent = true,
        splitbelow = true, -- Splitting a new window below the current one
        splitright = true, -- Splitting a new window at the right of the current one
        swapfile = false, -- Disable use of swapfile for the buffer
        tabstop = 4, -- Number of space in a tab
        softtabstop = 4, -- Number of space in a tab
        shiftwidth = 4, -- Number of space inserted for indentation
        expandtab = true, -- Use spaces instead of tabs
        smarttab = true, -- Insert spaces when tab is pressed
        shiftround = true, -- Round indent to multiple of shiftwidth
        termguicolors = true, -- Enable 24-bit RGB color in the TUI
        timeoutlen = 300, -- Length of time to wait for a mapped sequence
        undofile = true, -- Enable persistent undo
        hlsearch = true,
        incsearch = true,
        updatetime = 300, -- Length of time to wait before triggering the plugin
        wrap = false, -- Disable wrapping of lines longer than the width of window
        writebackup = false, -- Disable making a backup before overwriting a file
        winbar = '%m %f', -- Statusline
        foldlevelstart = 99,
        foldlevel = 3,
        foldmethod = 'expr',
        foldexpr = 'nvim_treesitter#foldexpr()',
        cmdheight = 1,
        spelllang = 'en',
        spell = false,

        -- colorcolumn = '80',
    },
}

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append 'c'
vim.g.mapleader = ' '

for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end

