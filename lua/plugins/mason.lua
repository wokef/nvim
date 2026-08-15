return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "copilot",
        "cssls",
        "emmet_ls",
        "html",
        "jsonls",
        "lemminx",
        "lua_ls",
        "markdown_oxide",
        "phpactor",
        "vtsls",
        "vue_ls",
        "yamlls",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "beautysh",
        "blade-formatter",
        "eslint_d",
        "nginx-config-formatter",
        "pint",
        "prettier",
        "sql-formatter",
        "stylua",
      },
    })
  end,
}
