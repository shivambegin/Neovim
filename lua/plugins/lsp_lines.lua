return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "BufReadPost",
  enabled = false,
  config = function()
    require("lsp_lines").setup()
  end,
}
