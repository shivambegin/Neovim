return {
  "tamton-aquib/staline.nvim",
  config = function()
    require("staline").setup({
      sections = {
        left = { "  ", "mode", " ", "branch", " ", "lsp" },
        mid = { "lsp_name" },
        right = { "file_name" },
      },
      mode_colors = {
        i = "#d4be98",
        n = "#84a598",
        c = "#8fbf7f",
        v = "#fc802d",
      },
      defaults = {
        true_colors = true,
        branch_symbol = " ",
      },
    })
    require("stabline").setup({
      font_active = "none",
      stab_start = "  %#Identifier#  ",
      stab_bg = "none",
      stab_left = "",
      inactive_fg = "none",
    })
  end,
}
