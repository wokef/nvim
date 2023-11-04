local k = vim.keymap

k.set("n", "<leader>q", "<cmd>:q<CR>", { desc = "Quit" })

-- nvim-tree
k.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle files explorer" })

-- telescope
k.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Search file" })
