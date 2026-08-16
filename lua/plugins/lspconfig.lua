return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local k = vim.keymap.set

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = function(desc)
          return {
            noremap = true,
            silent = true,
            buffer = ev.buf,
            desc = desc,
          }
        end

        k("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
        k("n", "<leader>lr", vim.lsp.buf.rename, opts("Smart rename"))
        k("n", "<leader>d", vim.diagnostic.open_float, opts("Show line diagnostics"))
        k("n", "K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor"))
        k("n", "<leader>lR", ":lsp restart<CR>", opts("Restart LSP"))
      end,
    })

    local icons = require("bootstrap.icons").lsp
    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.Error,
          [vim.diagnostic.severity.WARN] = icons.Warn,
          [vim.diagnostic.severity.INFO] = icons.Info,
          [vim.diagnostic.severity.HINT] = icons.Hint,
        },
      },
    })

    vim.lsp.enable("laravel_lsp")
  end,
}
