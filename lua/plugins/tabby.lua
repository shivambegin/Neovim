return {
  "nanozuki/tabby.nvim",
  event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("tabby.tabline").use_preset("tab_only")
    -- configs...
  end,
}
