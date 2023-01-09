function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
map('i', shortcut, command)
end

vim.cmd('colorscheme jellybeans')
vim.g.mapleader = ' '
vim.g.NERDTreeDirArrowExpandable= '+'
vim.g.NERDTreeDirArrowCollapsible="~"
vim.g.slime_target="tmux"
vim.g.slime_cell_delimiter = "##"
vim.g.slime_paste_file = "$HOME/.slime_paste"
vim.api.nvim_set_keymap('n', '<leader>s', '<Plug>SlimeSendCell', {})
vim.cmd('let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}')
nmap('<leader>f', 'V%<Plug>SlimeSendCell')
-- nnoremap <C-u> <V><%><Plug>SlimeSendCell
-- nnoremap <C-f> :NERDTreeFocus<CR>
-- nmap('<C-n>', ':NERDTree<CR>')
nmap('<C-t><C-r>', ':NERDTreeToggle<CR>')
-- nmap('<C-l>', ':call, CocActionAsync("jumpDefinition")<CR>')
nmap('<C-J>', '<C-W><C-J>')
nmap('<C-K>', '<C-W><C-K>')
nmap('<C-L>', '<C-W><C-L>')
nmap('<C-H>', '<C-W><C-H>')
nmap('<F8>', ':TagbarToggle<CR>')

