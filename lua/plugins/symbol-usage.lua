return {
  "Wansmer/symbol-usage.nvim",
  event = "LspAttach",
  opts = {
    hl = { link = "NonText" },
    references = { enabled = true, include_declaration = false },
    definition = { enabled = true },
    implementation = { enabled = true },
  },
}
