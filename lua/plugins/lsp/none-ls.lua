return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local mason_null_ls = require("mason-null-ls")
    local null_ls = require("null-ls")
    local null_ls_utils = require("null-ls.utils")

    mason_null_ls.setup({
      ensure_installed = {
        "eslint_d",
        "pint",
        "prettier",
        "stylua",
        "sql-formatter",
      },
    })

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local lsp_config = require("bootstrap.common").lsp_config

    local config = {
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      sources = {
        formatting.pint.with({
          extra_args = {
            "--config",
            lsp_config("pint"),
          },
        }),
        formatting.prettier.with({
          extra_args = {
            "--no-editorconfig",
            "--config",
            lsp_config("prettier"),
          },
        }),
        formatting.sql_formatter.with({
          extra_args = {
            "--config",
            lsp_config("sql-formatter"),
          },
          extra_filetypes = { "mysql" },
        }),
        formatting.stylua,
        diagnostics.eslint_d,
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    }

    null_ls.setup(config)
  end,
}
