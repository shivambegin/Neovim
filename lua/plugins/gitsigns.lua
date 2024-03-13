return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▐" },
        change = { text = "▐" },
        delete = { text = "▐" },
        topdelete = { text = "▐" },
        changedelete = { text = "▐" },
        untracked = { text = "▐" },
      },
      attach_to_untracked = false,
      preview_config = {
        -- Options passed to nvim_open_win
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    })
  end,
}
