--theme switcher
return {
  "zaldih/themery.nvim",
  config = function()
    -- Minimal config
    require("themery").setup({
      themes = { "gruvbox", "ayu", "carbonfox", "molokai", "everforest", "sonokai" }, -- Your list of installed colorschemes
      themeConfigFile = "~/.config/nvim/lua/config/theme-select.lua", -- Described below
      livePreview = true, -- Apply theme while browsing. Default to true.
    })
    vim.keymap.set("n", "<leader>sc", "<cmd>Themery<CR>", { desc = "theme selector" })
  end,
}
