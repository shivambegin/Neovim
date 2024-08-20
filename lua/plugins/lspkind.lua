return {
  "onsails/lspkind.nvim",
  opts = {
    mode = "symbol",
    symbol_map = {
      Array = "󰅪",
      Boolean = "⊨",
      Class = "󰌗",
      Constructor = "",
      Key = "󰌆",
      Namespace = "󰅪",
      Null = "NULL",
      Number = "#",
      Object = "󰀚",
      Package = "󰏗",
      Property = "",
      Reference = "",
      Snippet = "",
      String = "󰀬",
      TypeParameter = "󰊄",
      Unit = "",
    },
    menu = {},
  },
  enabled = vim.g.icons_enabled,
  config = function(_, opts)
    require("lspkind").init(opts)
  end,
}
