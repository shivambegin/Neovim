return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "tiagovla/scope.nvim",
      config = function()
        require("scope").setup()
      end,
    },
  },
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = "thin", -- slant, padded_slant; slope, padded_slope; thick; thin
        color_icons = true,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        diagnostics_indicator = true,
        always_show_bufferline = true,
        themable = true,
        show_buffer_icons = true,
      },
    })
  end,
}
