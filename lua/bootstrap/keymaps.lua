local k = vim.keymap

k.set("n", "<leader>q", "<cmd>:q<CR>", { desc = "Quit" })

k.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Files explorer" })

-- search
k.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Search by filename" })
k.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Search in file content" })
k.set("n", "<leader>fh", "<cmd>Telescope oldfiles<CR>", { desc = "Search in history" })
k.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Search in buffers" })

-- git
-- k.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Lazygit" })
k.set(
  "n",
  "<leader>gj",
  "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
  { desc = "Next Hunk" }
)
k.set(
  "n",
  "<leader>gk",
  "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
  { desc = "Prev Hunk" }
)
k.set("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
k.set("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
k.set("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
k.set("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
k.set("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Undo Stage Hunk" })
k.set("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
