--TODO: Learn to use this plugin properly
return {
  "mistricky/codesnap.nvim",
  build = "make",
  config = function()
    require("codesnap").setup()
  end,
}
