return {
  "rcarriga/nvim-notify",
  opts = {
    split = true,
    background_colour = "#000000",
    render = "compact",
    stages = "fade_in_slide_out",
    top_down = true,
  },
  keys = {
    { "<leader>tn", "<cmd>Telescope notify<cr>", desc = "Notifications" },
    {
      "<leader>uN",
      function()
        local notify = require("notify")

        local lines = {}
        for _, notif in ipairs(notify.history()) do
          table.insert(lines, ("%s %s: %s"):format(notif.title[1], notif.title[2], table.concat(notif.message, "\n")))
        end
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.cmd("vsplit")
        vim.api.nvim_win_set_buf(0, buf)
      end,
      desc = "Notifications",
    },
    {
      "<leader>un",
      function()
        return require("notify").dismiss()
      end,
      desc = "Dismiss Notifications",
    },
  },
}
