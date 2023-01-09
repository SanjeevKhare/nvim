require("bufferline").setup{}
vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
