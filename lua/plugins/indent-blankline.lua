-- Indent guide for Neovim
return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = false,
  main = "ibl",
  config = function()
    require("ibl").setup({
      debounce = 100,
      indent = { char = "│" },
      whitespace = { highlight = { "Whitespace", "NonText" } },
    })
  end,
}
