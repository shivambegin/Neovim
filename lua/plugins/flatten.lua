--open files in neovim without creating a nested sessions
return {
  "willothy/flatten.nvim",
  priority = 1001,
  opts = {
    window = {
      open = "alternate",
    },
  },
}
