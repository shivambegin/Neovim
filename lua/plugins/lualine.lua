return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  enabled = false,
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
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
        -- { "fancy_mode", width = 3 },
        { "mode" },
      },
      lualine_b = {
        { "fancy_branch" },
        { "fancy_diff" },
      },
      lualine_c = {
        { "fancy_cwd", substitute_home = true },
        { "filename" },
      },
      lualine_x = {
        { "fancy_macro" },
        { "fancy_diagnostics" },
        { "fancy_searchcount" },
        -- { "fancy_location" },
      },
      lualine_y = {
        { "fancy_filetype", ts_icon = "" },
      },
      lualine_z = {
        { "fancy_lsp_servers" },
      },
    },
  },
}
