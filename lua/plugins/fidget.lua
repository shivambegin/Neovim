return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  enabled = false,
  config = function()
    vim.api.nvim_set_hl(0, "FidgetTitle", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FidgetTask", { bg = "NONE" })
    require("fidget").setup({
      progress = {
        display = {
          done_icon = "󰄬",
        },
      },
      notification = {
        window = {
          align = "bottom",
          winblend = 0,
          x_padding = 2,
          y_padding = 0,
        },
        view = {
          group_separator = "",
        },
      },
    })
  end,
}
