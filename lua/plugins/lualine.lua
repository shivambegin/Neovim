local sources = require("plugins.utils.lualine_sources")

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    local colors = require("tokyonight.colors")
    local tokyonight = require("lualine.themes.tokyonight")

    vim.opt.laststatus = 3
    tokyonight.normal.c.bg = colors.night.bg
    opts.options.theme = tokyonight

    require("lualine").setup(opts)
  end,
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { sources.mode },
      lualine_b = { sources.branch, sources.diff },
      lualine_c = { sources.filetype, sources.macro },
      lualine_x = { sources.lsp, sources.diagnostics },
      lualine_y = { sources.indentation, sources.encoding, sources.fileformat },
      lualine_z = {--[[  sources.progress, sources.location ]]
      },
    },
  },
}
