return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup({
      -- Lua
      vim.keymap.set("n", "<leader>xx", function()
        require("trouble").toggle()
      end),
      vim.keymap.set("n", "<leader>xw", function()
        require("trouble").toggle("workspace_diagnostics")
      end),
      vim.keymap.set("n", "<leader>xd", function()
        require("trouble").toggle("document_diagnostics")
      end),
      vim.keymap.set("n", "<leader>xq", function()
        require("trouble").toggle("quickfix")
      end),
      vim.keymap.set("n", "<leader>xl", function()
        require("trouble").toggle("loclist")
      end),
      vim.keymap.set("n", "gR", function()
        require("trouble").toggle("lsp_references")
      end),
    })
  end,
}
