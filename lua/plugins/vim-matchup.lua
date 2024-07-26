--extends % motion
return {
  "andymass/vim-matchup",
  enabled = false,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  setup = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
