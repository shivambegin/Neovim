return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("rose-pine").setup({
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
