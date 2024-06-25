--colorpicker for neovim

return {
  "uga-rosa/ccc.nvim",
  cmd = "CccPick",
  config = function()
    require("ccc").setup({
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    })
  end,
}
