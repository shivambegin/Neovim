return {
  "hedyhli/outline.nvim",
  -- event = "LspAttach",
  keys = {
    { "<leader>ot", "<cmd>Outline<CR>", desc = "Toggle Outline" },
  },
  config = function()
    require("outline").setup({})
  end,
}
