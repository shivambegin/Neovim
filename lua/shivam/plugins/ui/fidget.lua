return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    tag = "legacy",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "meter",
          done = "Kawai",
        },
        window = {
          blend = 0, -- set 0 if using transparent background, otherwise set 100
        },
      })
    end,
  },
}
