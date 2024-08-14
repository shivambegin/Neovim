return {
  "X3eRo0/dired.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  enabled = false, -- oil but just worse(for now atleast)
  config = function()
    require("dired").setup({
      path_separator = "/",
      show_banner = false,
      show_hidden = true,
      show_dot_dirs = true,
      show_colors = true,
    })
  end,
}
