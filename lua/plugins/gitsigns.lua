return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,
  config = function()
    local gitsigns = require("gitsigns")
    local icons = require("config.icons")
    gitsigns.setup({
      signs = {
        add = { text = icons.misc.vertical_bar },
        untracked = { text = icons.misc.vertical_bar },
        change = { text = icons.misc.vertical_bar },
        delete = { text = icons.misc.vertical_bar },
        topdelete = { text = icons.misc.vertical_bar },
        changedelete = { text = icons.misc.vertical_bar },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      numhl = false, -- Toggle with `:Gitsigns toggle_nunhl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      sign_priority = 9,
      watch_gitdir = {
        interval = 1000,
      },
      attach_to_untracked = true,
    })
    --		if pcall(require, "scrollbar") then
    --			require("scrollbar.handlers.gitsigns").setup()
    --		end
  end,
}
