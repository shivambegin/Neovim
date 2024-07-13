-- override nvim ui
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { icon = "▍" },
        substitute = {
          pattern = "^:%%?s/",
          icon = " ",
          ft = "regex",
          opts = { border = { text = { top = " sub (old/new/) " } } },
        },
        input = { view = "cmdline_input", icon = "█" },
      },
    },
    messages = { view_search = "mini" },
    lsp = {
      progress = {
        enabled = false,
      },

      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      message = { view = "mini" },
      hover = { opts = { win_options = { winhighlight = { Normal = "NormalFloat" } } } },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
          throttle = 50,
        },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    routes = {
      { filter = { event = "msg_show", find = "%d+L, %d+B" }, view = "mini" },
      { filter = { event = "msg_show", find = "after #%d+" }, view = "mini" },
      { filter = { event = "msg_show", find = "before #%d+" }, view = "mini" },
      { filter = { event = "msg_showmode" }, opts = { skip = true } },
    },
    views = {
      notify = { win_options = { winblend = 0 } },
      mini = {
        -- align = 'message-center',
        -- position = { col = '50%' },
        win_options = { winhighlight = {}, winblend = 0 },
      },
      popup = { position = { row = "23", col = "50%" } },
      popupmenu = { position = { row = "23", col = "50%" } },
      cmdline_popup = {
        view = "cmdline",
        position = { row = "100%", col = 0 },
        size = { height = "auto", width = "100%" },
        border = { style = { "", "", "", "", "", "", "", "" } },
        text = nil,
      },
    },
  },
}
