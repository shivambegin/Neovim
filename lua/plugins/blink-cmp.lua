return {
  "saghen/blink.cmp",
  enabled = true,
  version = "*",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    signature = { enabled = true },
    keymap = {
      preset = "none",
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      cmdline = {
        preset = "enter",
      },
    },
  },
}
