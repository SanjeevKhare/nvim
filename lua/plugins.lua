vim.cmd([[
call plug#begin()
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-autopairs'
Plug 'folke/which-key.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'kdheepak/JuliaFormatter.vim'
"
" Completion engine + completion sources
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'honza/vim-snippets'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'http://github.com/tpope/vim-fugitive' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
" Plug 'numToStr/Comment.nvim'
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'jpalardy/vim-slime', { 'for': ['python', 'julia']}
Plug 'lervag/vimtex'
"Plug 'lervag/vimtex', {'for': ['plaintex']}
set encoding=UTF-8
call plug#end()
]])
