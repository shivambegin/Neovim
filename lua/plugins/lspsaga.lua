return {
  "nvimdev/lspsaga.nvim",
  enabled = false,
  lazy = true,
  event = "LspAttach",
  config = function()
    vim.keymap.set("n", "<leader>ot", "<cmd>Lspsaga outline<cr>", { desc = "Lspsaga | Code Outline", silent = true })
    require("lspsaga").setup({
      ui = {
        theme = "round",
        border = "rounded",
        winblend = 0,
        expand = "",
        collaspe = "",
        preview = " ",
        code_action = "󱧣 ",
        diagnostic = " ",
        hover = " ",
        kind = {},
      },
      lightbulb = {
        enable = false,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },
      symbol_in_winbar = {
        enable = false,
        separator = "  ",
        hide_keyword = true,
        show_file = true,
        folder_level = 0,
      },
    })
  end,
}
