return {
  "mikavilpas/yazi.nvim",
  enabled = false,
  event = "VeryLazy",
  keys = {
    {
      -- Open in the current working directory
      "<leader>cw",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open the file manager in nvim's working directory",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
  },
}
