local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "plugins" }, {
  install = {
    missing = true,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "node_provider",
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "spellfile",
        "tarPlugin",
        "man",
        "logiPat",
        "netrwSettings",
        "netrwFileHandlers",
        "netrw",
        "editorconfig",
        "netrwPlugin",
        "tohtml",
        "python3_provider",
        "remote_plugins",
        "rplugin",
      },
    },
  },
})
