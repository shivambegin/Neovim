--TODO  understand the proper way to set up the auto-save
return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      {
        enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
        trigger_events = { "InsertLeave" }, -- vim events that trigger auto-save. See :h events
      },
    })
  end,
}
