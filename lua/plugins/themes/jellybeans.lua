return {
  "wtfox/jellybeans.nvim",
  priority = 1000,
  config = function()
    require("jellybeans").setup()
    vim.cmd.colorscheme("jellybeans")
  end,
}
