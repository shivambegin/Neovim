return {
  "ChristianChiarulli/defaultplus",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  enabled = true,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd.colorscheme("defaultplus")
  end,
}
