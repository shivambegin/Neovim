return {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    main = "ibl",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    -- For setting shiftwidth and tabstop automatically.
    dependencies = "tpope/vim-sleuth",
    opts = {
      indent = {
        char = require("config.icons").misc.vertical_bar,
      },
      scope = {
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "lazy",
          "neo-tree",
          "notify",
          "text",
          "startify",
          "dashboard",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "oil",
        },
        buftypes = { "terminal", "nofile" },
      },
    },
  },
}
