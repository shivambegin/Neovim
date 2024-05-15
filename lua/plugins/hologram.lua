--image rendering in neovim
return {
  enabled = false,
  "edluffy/hologram.nvim",
  config = function()
    require("hologram").setup({
      auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
    })
  end,
}
