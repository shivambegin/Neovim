return {
  "lukas-reineke/headlines.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("headlines").setup({
      quarto = {
        query = vim.treesitter.query.parse(
          "markdown",
          [[
                (fenced_code_block) @codeblock
            ]]
        ),
        codeblock_highlight = "CodeBlock",
        treesitter_language = "markdown",
      },
    })
  end,
}
