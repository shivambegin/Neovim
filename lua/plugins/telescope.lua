return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "zig" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      "danielfalk/smart-open.nvim",
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope-fzy-native.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
      "willthbill/opener.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")

      vim.keymap.set("n", "<leader>tt", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>ch", builtin.colorscheme, {})
      vim.keymap.set("n", "<leader>fs", builtin.git_files, {})
      vim.keymap.set("n", "<leader>tc", builtin.command_history, {})
      vim.keymap.set("n", "<leader>so", function()
        telescope.extensions.smart_open.smart_open()
      end, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>gs", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set(
        "n",
        "<leader>sg",
        require("telescope").extensions.live_grep_args.live_grep_args,
        { desc = "Search by Grep" }
      )
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
      telescope.load_extension("refactoring")
      telescope.load_extension("notify")
      telescope.load_extension("smart_open")
      telescope.load_extension("live_grep_args")
      telescope.load_extension("opener")
    end,
  },
}
