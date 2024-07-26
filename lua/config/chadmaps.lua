-- keymaps related to nvchad

local map = vim.keymap.set

map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<A-t>", function()
  require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })

map("n", "<leader>sc", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })

local settings = {
  -- theme = "neofusion", -- ayu|gruvbox|neofusion
  indentChar = "│", -- │, |, ¦, ┆, ┊
  separatorChar = "-", -- ─, -, .
  aspect = "clean", -- normal|clean
  lualine_separator = "rect", -- rect|triangle|semitriangle|curve
  cmp_style = "nvchad", -- default|nvchad
  cmp_icons_style = "vscode", -- devicons|vscode
  transparent_mode = true,
}

return settings
