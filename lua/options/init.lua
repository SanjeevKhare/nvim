vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.autoindent=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.smarttab=true
vim.opt.softtabstop=4
vim.opt.mouse='a'
vim.opt.syntax='true'
vim.opt.hlsearch=true
vim.opt.foldmethod='syntax'
vim.opt.foldlevelstart=1
vim.opt.encoding='UTF-8'

vim.g.mapleader = ' '
vim.g.NERDTreeDirArrowExpandable= '+'
vim.g.NERDTreeDirArrowCollapsible="~"
vim.g.slime_target="tmux"
vim.g.slime_cell_delimiter = "##"
vim.g.slime_paste_file = "$HOME/.slime_paste"

-- Format on save
-- vim.cmd [[ autocmd BufWritePre * lua vim.lsp.buf.formatting_sync() ]]

