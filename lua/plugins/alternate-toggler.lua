-- toggle alternate value with just one keymap

return {
  "rmagatti/alternate-toggler",
  config = function()
    require("alternate-toggler").setup({
      alternates = {
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["Yes"] = "No",
        ["YES"] = "NO",
        ["1"] = "0",
        ["<"] = ">",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = "'",
        ['""'] = "''",
        ["+"] = "-",
        ["==="] = "!==",
      },
    })
    vim.keymap.set(
      "n",
      "<leader>i", -- <space><space>
      "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
    )
  end,
  event = { "BufReadPost" }, -- lazy load after reading a buffer
}
