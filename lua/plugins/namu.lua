return {
  "bassamsdata/namu.nvim",
  -- keys = {
  --   {
  --     "<leader>ss",
  --     "<cmd>lua require('namu').namu_symbols.show()<cr>",
  --     desc = "Jump to LSP symbol",
  --     silent = true,
  --   },
  --   {
  --     "<leader>th",
  --     "<cmd>lua require('namu').colorscheme.show()<cr>",
  --     desc = "Colorscheme Picker",
  --     silent = true,
  --   },
  -- },
  config = function()
    require("namu").setup({
      -- Enable the modules you want
      namu_symbols = {
        enable = true,
        options = {}, -- here you can configure namu
      },
      -- Optional: Enable other modules if needed
      colorscheme = {
        enable = false,
        options = {
          -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
          persist = true, -- very efficient mechanism to Remember selected colorscheme
          write_shada = false, -- If you open multiple nvim instances, then probably you need to enable this
        },
      },
      ui_select = { enable = false }, -- vim.ui.select() wrapper
    })
    -- === Suggested Keymaps: ===
    local namu = require("namu.namu_symbols")
    local colorscheme = require("namu.colorscheme")
    vim.keymap.set("n", "<leader>ss", namu.show, {
      desc = "Jump to LSP symbol",
      silent = true,
    })
    vim.keymap.set("n", "<leader>th", colorscheme.show, {
      desc = "Colorscheme Picker",
      silent = true,
    })
  end,
}
