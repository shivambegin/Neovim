return {
  "VidocqH/lsp-lens.nvim",
  enabled = false, --similar functionality as symbol-usage.nvim
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    enable = true,
    include_declaration = false, -- Reference include declaration
    sections = { -- Enable / Disable specific request
      definition = false,
      references = true,
      implementation = true,
    },
    ignore_filetype = {
      "prisma",
    },
  },
}
