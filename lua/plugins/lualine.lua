return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "│", right = "│" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
      refresh = {
        statusline = 100,
      },
    },
    sections = {
      lualine_a = {
        { "fancy_branch" },
      },
      lualine_b = { "none" },
      lualine_c = {
        { "fancy_cwd", substitute_home = true },
        { "fancy_diff" },
      },
      lualine_x = {
        { "fancy_macro" },
        { "fancy_diagnostics" },
      },
      lualine_y = { "none" },
      lualine_z = {
        { "fancy_lsp_servers" },
      },
    },
  },
}
