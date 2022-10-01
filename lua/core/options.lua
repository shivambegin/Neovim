local options = {
    opt = {
        backspace = vim.opt.backspace + { 'nostop' }, -- Don't stop backspace at insert
        -- clipboard = 'unnamedplus', -- Connection to the system clipboard
        completeopt = { 'menuone', 'noselect' }, -- Options for insert mode completion
        copyindent = true, -- Copy the previous indentation on autoindenting
        cursorline = true, -- Highlight the text line of the cursor
        fileencoding = 'utf-8', -- File content encoding for the buffer
        fillchars = { eob = ' ' }, -- Disable `~` on nonexistent lines
        history = 100, -- Number of commands to remember in a history table
        ignorecase = true, -- Case insensitive searching
        laststatus = 3, -- global statusline
        lazyredraw = true, -- lazily redraw screen
        mouse = 'a', -- Enable mouse support
        number = true, -- Show numberline
        preserveindent = true, -- Preserve indent structure as much as possible
        pumheight = 10, -- Height of the pop up menu
        relativenumber = true, -- Show relative numberline
        scrolloff = 8, -- Number of lines to keep above and below the cursor
        showmode = false, -- Disable showing modes in command line
        sidescrolloff = 2, -- Number of columns to keep at the sides of the cursor
        signcolumn = 'yes', -- Always show the sign column
        smartcase = true, -- Case sensitivie searching
        smartindent = true, -- Smart code indentation
        splitbelow = true, -- Splitting a new window below the current one
        splitright = true, -- Splitting a new window at the right of the current one
        swapfile = false, -- Disable use of swapfile for the buffer
        tabstop = 4, -- Number of space in a tab
        softtabstop = 4,
        shiftwidth = 4, -- Number of space inserted for indentation
        expandtab = true, -- Enable the use of space in tab
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
        cmdheight = 0,
        colorcolumn = '80',
    },
    g = {
        highlighturl_enabled = true, -- highlight URLs by default
        mapleader = ' ', -- set leader key
        zipPlugin = false, -- disable zip
        load_black = false, -- disable black
        loaded_2html_plugin = true, -- disable 2html
        loaded_getscript = true, -- disable getscript
        loaded_getscriptPlugin = true, -- disable getscript
        loaded_gzip = true, -- disable gzip
        loaded_logipat = true, -- disable logipat
        loaded_matchit = true, -- disable matchit
        loaded_netrwFileHandlers = true, -- disable netrw
        loaded_netrwPlugin = true, -- disable netrw
        loaded_netrwSettngs = true, -- disable netrw
        loaded_remote_plugins = true, -- disable remote plugins
        loaded_tar = true, -- disable tar
        loaded_tarPlugin = true, -- disable tar
        loaded_zip = true, -- disable zip
        loaded_zipPlugin = true, -- disable zip
        loaded_vimball = true, -- disable vimball
        loaded_vimballPlugin = true, -- disable vimball
    },
}

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append 'c'
vim.g.mapleader = ' '

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end
