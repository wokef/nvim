return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_settings = { selectedCompletionModel = 'gpt-4o-copilot' }

    vim.api.nvim_set_keymap("i", "<A-l>", 'copilot#Accept("<CR>")', {
      expr = true,
      silent = true,
      noremap = true,
    })
  end
}
