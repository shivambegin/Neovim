--Reveal whitespace characters in visual mode, similar to VSCode.
--removing it because hlchunk provide something similar
return {
  "mcauley-penney/visual-whitespace.nvim",
  enabled = false,
  config = true,
  opts = {
    highlight = { link = "Visual" },
    space_char = "·",
    tab_char = "→",
    nl_char = "󰘌",
  },
}
