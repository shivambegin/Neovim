return {
  "j-hui/fidget.nvim",
  tag = "legacy",

  config = function()
    require("fidget").setup({
      text = {
        spinner = "dots_negative", -- animation shown when tasks are ongoing
        done = "✔", -- character shown when all tasks are complete
        commenced = "Started", -- message shown when task starts
        completed = "Completed", -- message shown when task completes
      },
      align = {
        bottom = true, -- align fidgets along bottom edge of buffer
        right = true, -- align fidgets along right edge of buffer
      },
      window = {
        relative = "win", -- where to anchor, either "win" or "editor"
        blend = 0, -- &winblend for the window
        zindex = nil, -- the zindex value for the window
        border = "rounded", -- style of border for the fidget window
      },
    })
  end,
}
