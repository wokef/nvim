return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local icons = require("bootstrap.icons")
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local k = vim.keymap.set

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = function(desc)
          return {
            noremap = true,
            silent = true,
            buffer = ev.buf,
            desc = desc,
          }
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
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = icons.lsp
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
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
      end,
      ["tailwindcss"] = function()
        lspconfig["tailwindcss"].setup({
          capabilities = capabilities,
          filetypes = { "blade", "html", "markdown", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "vue" },
        })
      end,
      ["tsserver"] = function()
        lspconfig["tsserver"].setup({
          capabilities = capabilities,
          filetypes = { "typescript", "javascript" },
        })
      end,
      ["volar"] = function()
        lspconfig["volar"].setup({
          capabilities = capabilities,
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
        })
      end,
    })
  end,
}
