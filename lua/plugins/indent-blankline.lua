return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  config = function()
    dofile(vim.g.base46_cache .. "blankline")
    require("ibl").setup({
      indent = {
        char = "│",
        highlight = "IblChar",
      },
      scope = {
        enabled = false,
        show_start = false,
        show_end = false,
        injected_languages = true,
        show_exact_scope = false,
        include = {
          node_type = {
            ["typescript"] = {
              "unary_expression",
              "expression_statement",
              "return_statement",
              "open_tag",
              "key",
              "array",
              "object",
              "lexical_declaration",
              "switch_statement",
              "switch_case",
              "switch_body",
              "switch_default",
            },

            ["tsx"] = {
              "unary_expression",
              "jsx_expression",
              "jsx_self_closing_element",
              "expression_statement",
              "return_statement",
              "open_tag",
              "key",
              "array",
              "object",
              "lexical_declaration",
              "switch_statement",
              "switch_case",
              "switch_body",
              "switch_default",
            },
            ["rust"] = { "let_declaration", "const_declaration" },
          },
        },
      },
      exclude = {
        filetypes = {
          "help",
          "lazy",
          "neo-tree",
          "notify",
          "text",
          "startify",
          "dashboard",
          "neogitstatus",
          "NvimTree",
          "Trouble",
        },
        buftypes = { "terminal", "nofile" },
      },
    })
    dofile(vim.g.base46_cache .. "blankline")
  end,
}
