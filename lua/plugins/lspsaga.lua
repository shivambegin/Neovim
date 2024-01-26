return {
  "nvimdev/lspsaga.nvim",
  config = function()
    local keymap = vim.keymap

    require("lspsaga").setup({
      symbol_in_winbar = {
        enable = false,
      },
      ui = {
        border = "rounded",
      },
      lightbulb = {
        enable = false,
      },
    })
    keymap.set({ "n", "t" }, "<A-t>", "<cmd>Lspsaga term_toggle<cr>")

    keymap.set({ "n" }, "<leader>r", "<cmd>Lspsaga rename<cr>")
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
    keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<cr>")

    local builtin = require("telescope.builtin")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
        vim.keymap.set("n", "gr", builtin.lsp_references, opts)
      end,
    })

    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true })

    -- error lens
    vim.fn.sign_define({
      {
        name = "DiagnosticSignError",
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "ErrorLine",
      },
      {
        name = "DiagnosticSignWarn",
        text = "",
        texthl = "DiagnosticSignWarn",
        linehl = "WarningLine",
      },
      {
        name = "DiagnosticSignInfo",
        text = "",
        texthl = "DiagnosticSignInfo",
        linehl = "InfoLine",
      },
      {
        name = "DiagnosticSignHint",
        text = "",
        texthl = "DiagnosticSignHint",
        linehl = "HintLine",
      },
    })
  end,
}
