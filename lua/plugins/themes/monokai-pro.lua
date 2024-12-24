return{
  "loctvl842/monokai-pro.nvim",
  enabled = false,
  config = function()
    require("monokai-pro").setup()
    vim.cmd([[colorscheme monokai-pro]])
  end
}
