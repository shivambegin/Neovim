return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
  config = function()
    local icons = require("config.icons")
    require("gitsigns").setup({
      signs = {
        add = {
          -- hl = "GitSignsAdd",
          text = icons.ui.BoldLineMiddle,
          -- numhl = "GitSignsAddNr",
          -- linehl = "GitSignsAddLn",
        },
        change = {
          -- hl = "GitSignsChange",
          text = icons.ui.BoldLineDashedMiddle,
          -- numhl = "GitSignsChangeNr",
          -- linehl = "GitSignsChangeLn",
        },
        delete = {
          -- hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          -- numhl = "GitSignsDeleteNr",
          -- linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          -- hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          -- numhl = "GitSignsTopDeleteNr",
          -- linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          -- hl = "GitSignsChange",
          text = icons.ui.BoldLineMiddle,
          -- numhl = "GitSignsChangeNr",
          -- linehl = "GitSignsChangeLn",
        },
      },
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      update_debounce = 200,
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    })
  end,
}
