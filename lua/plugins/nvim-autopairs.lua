-- autopairing of (){}[] etc
return {
  "windwp/nvim-autopairs",
  enabled = false,
  event = "InsertEnter",
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    -- setup cmp for autopairs
    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
