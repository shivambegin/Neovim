return {
  {
    "mcauley-penney/visual-whitespace.nvim",
    event = "BufReadPre",
    branch = "async",
    config = function()
      require("visual-whitespace").setup({
        nl_char = "¬",
        excluded = {
          filetypes = { "aerial" },
          buftypes = { "help" },
        },
      })

      vim.keymap.set("n", "<leader>vw", require("visual-whitespace").toggle, {})
    end,
  },

  {
    "aaron-p1/match-visual.nvim",
    event = "BufReadPre",
    opts = {
      min_length = 3,
    },
    init = function()
      vim.api.nvim_set_hl(0, "VisualMatch", { link = "MatchParen" })
    end,
  },
}
