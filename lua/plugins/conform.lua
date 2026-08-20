return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        bash = { "beautysh" },
        blade = { "blade-formatter" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        mysql = { "sql_formatter" },
        nginx = { "nginxfmt" },
        php = { "pint" },
        sh = { "beautysh" },
        sql = { "sql_formatter" },
        sqlite = { "sql_formatter" },
        typescript = { "prettier" },
        vue = { "prettier" },
        yaml = { "prettier" },
        zsh = { "beautysh" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
    })

    local customFormatters = { "pint", "prettier", "sql_formatter" }
    for _, formatter in ipairs(customFormatters) do
      conform.formatters[formatter] = {
        prepend_args = { "--config", vim.fn.stdpath("config") .. "/formatters/" .. formatter .. ".json" },
      }
    end

    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
