return {
  "tamton-aquib/flirt.nvim",
  config = function()
    local f = require("flirt")
    vim.keymap.set("n", "<leader><left>", function()
      f.move("left")
    end, {})
    vim.keymap.set("n", "<leader><up>", function()
      f.move("up")
    end, {}) -- etc
    f.setup({
      override_open = true, -- experimental
      close_command = "Q",
      default_move_mappings = true, -- <C-arrows> to move floats
      default_resize_mappings = true, -- <A-arrows> to resize floats
      default_mouse_mappings = true, -- Drag floats with mouse
      exclude_fts = { "notify", "cmp_menu" },
      speed = 95, -- Can vary from 1 to 100 (100 is fast)
      custom_filter = function(buffer, win_config)
        return vim.bo[buffer].filetype == "cmp_menu" -- avoids animation
      end,
      -- more options on the way.
    })
  end,
}
