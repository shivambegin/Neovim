return {
  "nvimdev/lspsaga.nvim",
  lazy = true,
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
      },
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
    })
  end,
}
