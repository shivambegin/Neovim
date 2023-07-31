vim.opt.backspace:append { 'nostop' } -- Don't stop backspace at insert
if vim.fn.has 'nvim-0.9' == 1 then
    vim.opt.diffopt:append 'linematch:60' -- enable linematch diff algorithm
end

local options = {
    opt = {
        -- clipboard = 'unnamedplus', -- Connection to the system clipboard
        autochdir = false, -- Use current file dir as working dir (See project.nvim)
        breakindent = true, -- Wrap indent to match  line start
        cmdheight = 1, -- Height of the command line
        colorcolumn = '80', -- PEP8 like character limit vertical bar.
        completeopt = { 'menu', 'menuone', 'noselect' }, -- Options for insert mode completion
        copyindent = true, -- Copy the previous indentation on autoindenting
        cursorline = true, -- Highlight the text line of the cursor
        expandtab = true, -- Enable the use of space in tab
        fileencoding = 'utf-8', -- File content encoding for the buffer
        fillchars = { eob = ' ' }, -- Disable `~` on nonexistent lines
        foldenable = true, -- enable fold for nvim-ufo
        foldlevel = 99, -- set high foldlevel for nvim-ufo
        foldlevelstart = 99, -- start with all code unfolded
        history = 1000, -- Number of commands to remember in a history table (per buffer).
        ignorecase = true, -- Case insensitive searching
        infercase = true, -- Infer cases in keyword completion
        laststatus = 3, -- globalstatus
        linebreak = true, -- Wrap lines at 'breakat'
        mouse = 'a', -- Enable mouse support.
        number = true, -- Show numberline
        preserveindent = true, -- Preserve indent structure as much as possible
        pumheight = 10, -- Height of the pop up menu
        relativenumber = true, -- Show relative numberline
        scrolloff = 1000, -- Number of lines to leave before/after the cursor when scrolling. Setting a high value keep the cursor centered.
        selection = 'old', -- Don't select the newline symbol when using <End> on visual mode
        shiftwidth = 2, -- Number of space inserted for indentation
        showmode = false, -- Disable showing modes in command line
        sidescrolloff = 8, -- Same but for side scrolling.
        signcolumn = 'yes', -- Always show the sign column
        smartcase = true, -- Case sensitivie searching
        smartindent = true, -- Smarter autoindentation
        splitbelow = true, -- Splitting a new window below the current one
        splitright = true, -- Splitting a new window at the right of the current one
        swapfile = false, -- Ask what state to recover when opening a file that was not saved.
        tabstop = 2, -- Number of space in a tab
        termguicolors = true, -- Enable 24-bit RGB color in the TUI
        timeoutlen = 300, -- Shorten key timeout length a little bit for which-key
        undodir = vim.fn.stdpath 'data' .. '/undodir', -- Chooses where to store the undodir
        undofile = true, -- Enable persistent undo between session and reboots
        updatetime = 200, -- Length of time to wait before triggering the plugin
        virtualedit = 'block', -- allow going past end of line in visual block mode
        winbar = '%m %f', -- Statusline
        wrap = true, -- Disable wrapping of lines longer than the width of window.
        writebackup = false, -- Disable making a backup before overwriting a file
    },
    g = {
        mapleader = ' ', -- set leader key
        maplocalleader = ',', -- set default local leader key
        autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        autopairs_enabled = false, -- enable autopairs at start
        inlay_hints_enabled = false, -- enable LSP inlay_hints at startup
        semantic_tokens_enabled = true, -- enable LSP semantic tokens on startup
        cmp_enabled = true, -- enable completion at start
        codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        highlighturl_enabled = true, -- highlight URLs by default
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
        lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
        notifications_enabled = true, -- disable notifications when toggling UI elements
    },
    t = vim.t.bufs and vim.t.bufs or { bufs = vim.api.nvim_list_bufs() }, -- initialize buffers for the current tab
}

-- set variables
for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end
