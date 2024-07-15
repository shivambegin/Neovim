return { --* Cheatsheets for the editor, multiple vim plugins, nerd-fonts, regex, etc *--
  "doctorfree/cheatsheet.nvim",
  cmd = "Cheatsheet",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    require("cheatsheet").setup({
      bundled_cheetsheets = {
        enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
        disabled = { "nerd-fonts" },
      },
      bundled_plugin_cheatsheets = {
        enabled = {
          "auto-session",
          "goto-preview",
          "octo.nvim",
          "telescope.nvim",
          "vim-easy-align",
          "vim-sandwich",
        },
      },
      include_only_installed_plugins = true,
    })
  end,
}
