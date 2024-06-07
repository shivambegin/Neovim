return {
  enabled = false, -- can't use it with nvim autopair
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  branch = "v0.6", --recommended as each new version will have breaking changes
  opts = {},
}
