return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  -- dependencies = {
  --   "hrsh7th/cmp-nvim-lsp",
  -- },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    -- import cmp-nvim-lsp plugin
    -- local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    -- local capabilities = cmp_nvim_lsp.default_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- configure matlab server
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure matlab server
    lspconfig["matlab_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure yaml server>
    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure htmx server
    lspconfig["htmx"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure bash server
    lspconfig["bashls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure golang server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })

    -- configure typescript server with plugin
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure svelte server
    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    })

    -- configure prisma orm server
    lspconfig["prismals"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure graphql language server
    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          -- diagnostics >= {
          --     globals = { "vim" },
          --   },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    local x = vim.diagnostic.severity
    local icons = require("config.icons")
    local config = {
      -- Enable virtual text
      virtual_text = { -- or false for disable
        prefix = "", -- ■  󰊠
        suffix = "",
        format = function(diagnostic)
          local prefix = icons.misc.Ghost .. " "
          local suffix = " "
          -- return full message with custom prefix & suffix
          return prefix .. diagnostic.message .. suffix
        end,
      },
      update_in_insert = true,
      signs = {
        text = {
          [x.ERROR] = icons.diagnostics.Error,
          [x.WARN] = icons.diagnostics.Warn,
          [x.HINT] = icons.diagnostics.Hint,
          [x.INFO] = icons.diagnostics.Info,
        },
        numhl = {
          [x.ERROR] = "WarningMsg",
          [x.WARN] = "ErrorMsg",
          [x.HINT] = "DiagnosticHint",
          [x.INFO] = "DiagnosticInfo",
        },
      },
      underline = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)
    -- add borders to lsp info window
    require("lspconfig.ui.windows").default_options.border = "single"
  end,
}
