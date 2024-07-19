return {
  "nvimdev/lspsaga.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
      },
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = true,
      },
    })
  end,
}
