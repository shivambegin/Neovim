return {
    "stevearc/dressing.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("dressing").setup({
        input = {
          win_options = {
            winhighlight = "NormalFloat:DiagnosticError",
          },
        },
      })
    end,
  }
