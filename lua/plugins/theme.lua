return {
  {
    "ramojus/mellifluous.nvim",
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
      require("mellifluous").setup({}) -- optional, see configuration section.
      vim.cmd("colorscheme mellifluous")
    end,
  },
}
