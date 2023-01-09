local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require'packer'.startup(function(use)
-- Telescope
use 'nvim-lua/plenary.nvim'
use {"nvim-telescope/telescope.nvim",  tag = '0.1.0'}

-- Treesitter
use {"nvim-treesitter/nvim-treesitter", 
	run = '<cmd>TSUpdate', 
	event = 'BufWinEnter', 
	config = "require('treesitter.config')", 
	requires =  'nvim-tree/nvim-web-devicons'
}

use 'nvim-tree/nvim-tree.lua'
use 'p00f/nvim-ts-rainbow'
use 'windwp/nvim-autopairs'
use 'folke/which-key.nvim'

use 'neovim/nvim-lspconfig'
use 'JuliaEditorSupport/julia-vim'
-- Completion engine + completion sources
use {'hrsh7th/nvim-cmp',
	config = function() require'cmp'.setup{snippet = { expand = function(args) require'luasnip'.lsp_expand(args.body)end}, 
	sources = {{name = 'luasnip'}, {name = 'buffer'}, {name = 'path'}, {name = 'nvim_lsp'}},
	} end
	}
-- For luasnip users.
use ({'L3MON4D3/LuaSnip', tag = "v<CurrentMajor>.*"})
use 'saadparwaiz1/cmp_luasnip'
use 'rafamadriz/friendly-snippets'
use 'honza/vim-snippets'
use 'nvim-tree/nvim-web-devicons' --" Recommended (for coloured icons)

use {'akinsho/bufferline.nvim', tag = 'v3.*', config = function(use) require'toggleterm'.setup{} end}

use 'http://github.com/tpope/vim-surround' --" Surrounding ysw)
use 'http://github.com/tpope/vim-fugitive' --" Surrounding ysw)
use 'https://github.com/preservim/nerdtree' --" NerdTree
use 'numToStr/Comment.nvim'
use 'https://github.com/vim-airline/vim-airline' --" Status bar
use 'https://github.com/ap/vim-css-color' --  " CSS Color Preview
use 'https://github.com/rafi/awesome-vim-colorschemes' --" Retro Scheme
use 'https://github.com/ryanoasis/vim-devicons' --" Developer Icons
use 'https://github.com/tc50cal/vim-terminal' --" Vim Terminal
use 'https://github.com/preservim/tagbar' --" Tagbar for code navigation
use 'https://github.com/terryma/vim-multiple-cursors' --" CTRL + N for multiple cursors
use {'jpalardy/vim-slime',  filetypes = {'python', 'julia'}}
use 'lervag/vimtex'

use {"lukas-reineke/indent-blankline.nvim", config = function() require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
} end}

use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
  end
}

use { "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,}

-- set encoding=UTF-8
--
 if packer_bootstrap then
    require('packer').sync()
 end
end)
