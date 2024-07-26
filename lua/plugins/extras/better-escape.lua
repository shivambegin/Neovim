-- TODO: find the working for this after rewrite
return {
  "max397574/better-escape.nvim",
  enabled = false,
  event = "InsertEnter",
  config = function()
    require("better_escape").setup({
      mapping = { "jk", "jj" }, -- a table with mappings to use
      timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
      clear_empty_lines = false, -- clear line after escaping if there is only whitespace
      keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
    })
  end,
}
