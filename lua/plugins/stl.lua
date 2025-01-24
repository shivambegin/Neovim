return {
  {
    "sontungexpt/sttusline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    enabled = false,
    event = { "BufEnter" },
    -- branch = "table_version",
    config = function()
      require("sttusline").setup({
        statusline_color = "StatusLine",
        laststatus = 3,
        disabled = {
          filetypes = {
            "NvimTree",
            "lazy",
            "mason",
          },
          buftypes = {
            "terminal",
          },
        },
        components = {
          "mode",
          "filename",
          "git-branch",
          "git-diff",
          "%=",
          "diagnostics",
          "lsps-formatters",
          "indent",
          "encoding",
          "pos-cursor",
          "pos-cursor-progress",
        },
      })
    end,
  },
}
