return {
  "ramojus/mellifluous.nvim",
  enabled = false,
  config = function()
    require("mellifluous").setup({
      colorset = "mellifluous", -- mellifluous, alduin, mountain, tender, kanagawa_dragon
      mellifluous = {
        neutral = true,
      },
      dim_inactive = false,
      flat_background = {
        line_numbers = true,
        floating_widndows = true,
        file_tree = true,
        cursor_line_number = true,
      },
    })
    vim.cmd("colorscheme mellifluous")
  end,
}
