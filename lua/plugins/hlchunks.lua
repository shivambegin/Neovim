return {
  "shellRaining/hlchunk.nvim",
  enabled = false,
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  opts = {
    indent = { enable = true, use_treesitter = true },
    chunk = {
      enable = false,
      notify = false,
      chars = { right_arrow = "─" },
    },
  },
}
