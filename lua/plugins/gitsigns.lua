return {
  "lewis6991/gitsigns.nvim",
  event = { "CursorHold", "CursorHoldI" },
  enabled = true,
  config = function()
    local gitsigns = require("gitsigns")
    local sign_icon = require("config.icons").misc.vertical_bar
    gitsigns.setup({
      signs = {
        add = { text = sign_icon },
        untracked = { text = sign_icon },
        change = { text = sign_icon },
        delete = { text = sign_icon },
        topdelete = { text = sign_icon },
        changedelete = { text = sign_icon },
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
