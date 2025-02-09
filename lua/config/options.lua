--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.diagnostic.enable(false)
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.gcr = {
  "i-c-ci-ve:-block-TermCursor",
  "n-v:block-Curosr/lCursor",
  "o:hor50-Curosr/lCursor",
  "r-cr:hor20-Curosr/lCursor",
}

-- vim.opt.list = false
-- vim.opt.listchars = {
--   tab = "│ ",
--   trail = "·",
-- }
-- vim.opt.fillchars = {
--   fold = "·",
--   foldsep = " ",
--   eob = " ",
-- }

vim.opt.mousemoveevent = true
vim.opt.ruler = false
vim.opt.smoothscroll = true
vim.opt.breakindent = true
-- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.pumblend = 10
vim.opt.showmode = true -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
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
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.cursorlineopt = "both"
vim.opt.number = true -- set numbered lines
vim.opt.laststatus = 0 --disable native statusline
vim.opt.showcmd = false
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.statuscolumn = "%l%s"
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
vim.opt.inccommand = "split" -- split below for to show replaces
vim.opt.virtualedit = "block"
vim.opt.autowriteall = true
vim.o.completeopt = "menu,menuone,noselect"
-- vim.opt.fillchars = vim.opt.fillchars + "eob: "
-- vim.opt.fillchars:append({
--   stl = " ",
-- })

vim.opt.shortmess:append("c")
vim.opt.pumheight = 5 -- Looks good on the cmdline
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

-- Rulers
vim.opt.colorcolumn = "80,120" -- Add vertical rulers at columns 80 and 120

-- -- Highlight trailing spaces
-- vim.cmd([[
--   highlight ExtraWhitespace ctermbg=red guibg=red
--   match ExtraWhitespace /\s\+$/
--   autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
--   autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
--   autocmd InsertLeave * match ExtraWhitespace /\s\+$/
--   autocmd BufWinLeave * call clearmatches()
-- ]])
