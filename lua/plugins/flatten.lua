--open files in neovim without creating a nested sessions
return {
  "willothy/flatten.nvim",
  priority = 999,
  config = {
    window = {
      open = "alternate",
    },
  },
}
