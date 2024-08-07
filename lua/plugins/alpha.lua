return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "juansalvatore/git-dashboard-nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    local git_dashboard = require("git-dashboard-nvim").setup({})

    dashboard.section.header.val = git_dashboard
    dashboard.section.buttons.val = {}

    require("alpha").setup(dashboard.opts)
  end,
}
