local k = vim.keymap.set

k("n", "<leader>q", "<cmd>:q<CR>", { desc = "Quit" })
k("n", "<leader>c", "<cmd>:bd<CR>", { desc = "Close buffer" })
k("n", "<leader>o", "<cmd>:on<CR>", { desc = "Close others windows" })
k("n", "<leader>bo", "<cmd>:BufferLineCloseOthers<CR>", { desc = "Close others buffers" })
k("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Files explorer" })

-- navigation
k("n", "H", ":BufferLineCyclePrev<CR>")
k("n", "L", ":BufferLineCycleNext<CR>")

-- move selection indent mode and up/down
k("v", "<", "<gv")
k("v", ">", ">gv")
k("n", "<A-j>", ":m .+1<CR>==")
k("n", "<A-k>", ":m .-2<CR>==")
k("x", "<A-j>", ":m '>+1<CR>gv-gv")
k("x", "<A-k>", ":m '<-2<CR>gv-gv")
k("n", "]q", ":cnext<CR>")
k("n", "[q", ":cprev<CR>")

-- search
k("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Search by filename" })
k("n", "<leader>st", "<cmd>Telescope live_grep<CR>", { desc = "Search in file content" })
k("n", "<leader>sr", "<cmd>Telescope oldfiles<CR>", { desc = "Search recent file" })
k("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Search in buffers" })

-- git
-- k("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Lazygit" })
k("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", { desc = "Next Hunk" })
k("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", { desc = "Prev Hunk" })
k("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
k("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
k("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
k("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
k("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Undo Stage Hunk" })
k("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
