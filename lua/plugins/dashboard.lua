return {
  "nvimdev/dashboard-nvim",
  enabled = false,
  event = "VimEnter",
  config = function()
    local dashboardImage = vim.api.nvim_create_augroup("DashboardImage", { clear = true })
    local img = require("image").from_file("/home/shivam/Pictures/Screenshots/NeoVimLogo.png")
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      group = dashboardImage,
      callback = function()
        img:render()
        img:move(27, 1)
      end,
    })
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      group = dashboardImage,
      callback = function()
        img:clear()
      end,
    })

    require("dashboard").setup({})
    require("image").setup({})
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
