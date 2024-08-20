-- toggle alternate value with just one keymap

return {
  "rmagatti/alternate-toggler",
  keys = {
    { "<leader>i", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>" },
  },
  config = function()
    require("alternate-toggler").setup({
      alternates = {
        ["true"] = "false",
        ["top"] = "bottom",
        ["left"] = "right",
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
  end,
  -- event = { "BufReadPost" }, -- lazy load after reading a buffer
}
