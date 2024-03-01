-- Indent guide for Neovim
return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    indent = {
      char = " ",
      tab_char = " ",
    },
    scope = {
      enabled = true,
      char = " ",
      highlight = "NonText",
      show_start = true,
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)

    vim.cmd.highlight("clear @ibl.scope.underline.1")
    vim.cmd.highlight("link @ibl.scope.underline.1 Visual")
  end,
}
