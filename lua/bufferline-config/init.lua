require("bufferline").setup{}
vim.api.nvim_set_keymap("n", "[b", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "b]", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
