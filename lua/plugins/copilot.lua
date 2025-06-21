return {
  "github/copilot.vim",
  config = function()
    local options = { expr = true, silent = true, noremap = true }

    vim.g.copilot_settings = { selectedCompletionModel = 'gpt-4o-copilot' }

    vim.api.nvim_set_keymap("i", "<A-w>", 'copilot#AcceptWord()', options)
    vim.api.nvim_set_keymap("i", "<A-l>", 'copilot#AcceptLine()', options)
    vim.api.nvim_set_keymap("i", "<A-a>", 'copilot#Accept("<CR>")', options)
  end
}
