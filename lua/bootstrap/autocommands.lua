vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = { "*" },
  callback = function()
    vim.hl.on_yank({ higroup = "Search", timeout = 100 })
  end,
})

vim.api.nvim_command([[cabbrev fly set foldenable<BAR>set foldmethod "indent"]])
vim.api.nvim_command([[cabbrev fln set nofoldenable]])

vim.api.nvim_create_user_command("BufferKill", function()
  require("bootstrap.common").buf_kill("bd")
end, {})

vim.api.nvim_create_user_command("LazyGit", function()
  require("bootstrap.common").lazy_git()
end, {})

vim.api.nvim_create_user_command("LazyDocker", function()
  require("bootstrap.common").lazy_docker()
end, {})

vim.api.nvim_create_user_command("ClearLogs", function()
  require("bootstrap.common").clear_logs()
end, {})

vim.api.nvim_create_user_command("CS", function()
  require("telescope.pickers")
    .new({
      layout_strategy = "center",
      layout_config = {
        center = {
          width = 0.2,
        },
      },
    }, {
      prompt_title = "Choose colorscheme",
      finder = require("telescope.finders").new_table({
        results = vim.fn.getcompletion("", "color"),
      }),
      sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
      attach_mappings = function()
        local actions = require("telescope.actions")

        actions.select_default:replace(function()
          local selection = require("telescope.actions.state").get_selected_entry()
          if selection then
            vim.cmd("highlight clear")
            vim.cmd("syntax reset")

            vim.cmd.colorscheme(selection[1])
          end
        end)
        return true
      end,
    })
    :find()
end, {})

vim.api.nvim_command([[set clipboard+=unnamedplus]])
