return {
  "tamton-aquib/staline.nvim",
  event = "VeryLazy",
  enabled = true,
  config = function()
    require("staline").setup({
      sections = {
        left = { "mode", " ", "branch", " ", "lsp" },
        mid = { "lsp_name" },
        right = { "Broken", "cool_symbol", "file_size" },
      },
      special_table = {
        neotree = { "neotree", " " },
        lazy = { "lazy", " " }, -- etc
      },
      mode_colors = {
        i = "#d4be98",
        n = "#84a598",
        c = "#8fbf7f",
        v = "#fc802d",
      },
      defaults = {
        true_colors = true,
        full_path = false,
        branch_symbol = " ",
        expand_null_ls = true, -- This expands out all the null-ls sources to be shown
        lsp_client_character_length = 1000, -- Shorten LSP client names.
        cool_symbol = "", -- Change this to override default OS icon.
        font_active = "none", -- "bold", "italic", "bold,italic", etc
      },
    })
    -- require("stabline").setup({
    --   font_active = "none",
    --   stab_start = "  %#Identifier#  ",
    --   stab_bg = "none",
    --   stab_left = "",
    --   inactive_fg = "none",
    --   fg = "#95c561",
    -- })
  end,
}
