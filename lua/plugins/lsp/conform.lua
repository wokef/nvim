return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local lsp_config = require("bootstrap.common").lsp_config

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        vue = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        php = { "pint" },
        blade = { "blade-formatter" },
        sql = { "sql_formatter" },
        mysql = { "sql_formatter" },
        sh = { "beautysh" },
        zsh = { "beautysh" },
        bash = { "beautysh" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
    })

    conform.formatters.pint = { prepend_args = { "--config", lsp_config("pint") } }
    conform.formatters.prettier = { prepend_args = { "--config", lsp_config("prettier") } }
    conform.formatters.sql_formatter = { prepend_args = { "--config", lsp_config("sql-formatter") } }

    vim.keymap.set({ "n", "v" }, "<leader>mf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
