return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "zig" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    keys = {
      {
        "<leader>sf",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find File (CWD)",
      },
      {
        "<leader>sh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Find Help",
      },
      {
        "<leader>sH",
        function()
          require("telescope.builtin").highlights()
        end,
        desc = "Find highlight groups",
      },
      {
        "<leader>sM",
        function()
          require("telescope.builtin").man_pages()
        end,
        desc = "Map Pages",
      },
      {
        "<leader>so",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "Open Recent File",
      },
      {
        "<leader>sg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader>sw",
        function()
          require("telescope.builtin").grep_string()
        end,
        desc = "Grep String",
      },
      {
        "<leader>sk",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>sC",
        function()
          require("telescope.builtin").commands()
        end,
        desc = "Commands",
      },
      {
        "<leader><leader>",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>sd",
        function()
          require("telescope.builtin").diagnostics()
        end,
        desc = "diagnostics",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        file_ignore_patterns = { "%.git/." },
        defaults = {
          preview = {
            treesitter = false,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
        },
        borderchars = {
          prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          results = { " ", " ", " ", " ", " ", " ", " ", " " },
        },
      })
      telescope.load_extension("ui-select")
      -- telescope.load_extension("refactoring")
      telescope.load_extension("notify")
    end,
  },
}
