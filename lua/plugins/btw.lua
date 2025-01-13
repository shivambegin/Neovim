return {
  "letieu/btw.nvim",
  event = "VimEnter",
  config = function()
    require("btw").setup({
      text = "I use Neovim (BTW)",
    })
  end,
}
