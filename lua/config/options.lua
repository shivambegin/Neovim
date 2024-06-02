vim.g.mapleader = " " -- change leader to a space
vim.g.maplocalleader = " " -- change localleader to a space
vim.g.loaded_netrw = 1 -- disable netrw
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.modifiable = true
vim.opt.backspace = { "start,eol,indent" }
vim.g.loaded_netrwPlugin = 1 --  disable netrw
vim.opt.incsearch = true -- make search act like search in modern browsers
vim.opt.foldenable = false
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 0 -- more space in the neovim command line for displaying messages
vim.opt.updatetime = 200
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.breakindent = true -- wrap lines with indent
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes:2" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 10 -- Makes sure there are always eight lines of context
vim.opt.sidescrolloff = 10 -- Makes sure there are always eight lines of context
vim.opt.smoothscroll = true
vim.opt.showcmd = false -- Don't show the command in the last line
vim.opt.ruler = false -- Don't show the ruler
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }
-- change the character at the end of buffer
vim.opt.laststatus = 3 -- disable statusline
vim.opt.splitkeep = "screen"
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.bo.autoread = true
vim.opt.autoread = true
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.path:append({ "**" })
vim.opt.splitkeep = "cursor"
-- vim.opt.formatoptions:append({ "r" })
vim.opt.listchars = {
  -- tab = ">>>",
  tab = "  ",
  trail = "·",
  precedes = "←",
  extends = "→",
  -- eol = "↲",
  nbsp = "␣",
}

vim.opt.list = true
vim.o.mousemoveevent = true
