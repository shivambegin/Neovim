return {
  "tamton-aquib/staline.nvim",
  config = function()
    require("staline").setup({
      sections = {
        left = { "  ", "mode", " ", "branch", " ", "lsp" },
        mid = { "lsp_name" },
        right = { "file_name", "line_column" },
      },
      mode_colors = {
        i = "#d4be98",
        n = "#84a598",
        c = "#8fbf7f",
        v = "#fc802d",
      },
      defaults = {
        true_colors = true,
        line_column = " [%l/%L] :%c  ",
        branch_symbol = " ",
      },
    })
    require("stabline").setup({
      style = "arrow", -- others: arrow, slant, bubble
      stab_left = "┃",
      stab_right = " ",
    })
  end,
}
