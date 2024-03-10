--Reveal whitespace characters in visual mode, similar to VSCode.
return {
  "mcauley-penney/visual-whitespace.nvim",
  config = true,
  opts = {
    highlight = { link = "Visual" },
    space_char = "·",
    tab_char = "→",
    nl_char = "󰘌",
  },
}
