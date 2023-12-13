return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local icons = require("bootstrap.icons")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local on_attach = function(client, bufnr)
      local k = vim.keymap.set

      local opts = function(desc)
        return {
          noremap = true,
          silent = true,
          buffer = bufnr,
          desc = desc,
        }
      end

      if client.supports_method("textDocument/documentSymbol") then
        require("nvim-navic").attach(client, bufnr)
      end

      k("n", "gr", "<cmd>Telescope lsp_references<CR>", opts("Show LSP references"))
      k("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
      k("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts("Show LSP definitions"))
      k("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts("Show LSP implementations"))
      k("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts("Show LSP type definitions"))
      k({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts("See available code actions"))
      k("n", "<leader>lr", vim.lsp.buf.rename, opts("Smart rename"))
      k("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts("Show buffer diagnostics"))
      k("n", "<leader>d", vim.diagnostic.open_float, opts("Show line diagnostics"))
      k("n", "[d", vim.diagnostic.goto_prev, opts("Go to previous diagnostic"))
      k("n", "]d", vim.diagnostic.goto_next, opts("Go to next diagnostic"))
      k("n", "K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor"))
      k("n", "<leader>lR", ":LspRestart<CR>", opts("Restart LSP"))
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = icons.lsp
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig["emmet_ls"].setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig["jsonls"].setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig["phpactor"].setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig["tsserver"].setup({ capabilities = capabilities, on_attach = on_attach })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    lspconfig["volar"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      init_options = {
        typescript = {
          tsdk = vim.fn.expand("$HOME")
            .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib",
        },
      },
    })
  end,
}
