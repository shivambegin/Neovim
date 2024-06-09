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
      enable = true,
      notify = true,
      chars = { right_arrow = "─" },
    },
  },
}
