return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
      },
      lightbulb = {
        enable = true,
      },
    })

    -- error lens
    vim.fn.sign_define({
      {
        name = "DiagnosticSignError",
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "ErrorLine",
      },
      {
        name = "DiagnosticSignWarn",
        text = "",
        texthl = "DiagnosticSignWarn",
        linehl = "WarningLine",
      },
      {
        name = "DiagnosticSignInfo",
        text = "",
        texthl = "DiagnosticSignInfo",
        linehl = "InfoLine",
      },
      {
        name = "DiagnosticSignHint",
        text = "",
        texthl = "DiagnosticSignHint",
        linehl = "HintLine",
      },
    })
  end,
}
