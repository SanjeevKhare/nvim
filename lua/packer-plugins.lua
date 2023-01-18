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

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use { 'rose-pine/neovim', config = "vim.cmd(':colorscheme rose-pine')" }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
    }

    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
    }


    use 'nvim-tree/nvim-web-devicons' --" Recommended (for coloured icons)

    use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
	    'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

    use { 'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" }
    use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" }
    use { 'windwp/nvim-autopairs', config = "require('autopairs-config')", after = "nvim-cmp" }
    use { 'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')" }

	-- Telescope

	use 'nvim-lua/plenary.nvim'  
    use 'nvim-telescope/telescope.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp' 
    use 'hrsh7th/cmp-buffer' 
    use 'hrsh7th/cmp-vsnip' 
use 'saadparwaiz1/cmp_luasnip'
use 'L3MON4D3/LuaSnip'
use 'rafamadriz/friendly-snippets'
use 'honza/vim-snippets'

-- Julia
use 'JuliaEditorSupport/julia-vim'
use 'hrsh7th/nvim-cmp'
use {'akinsho/toggleterm.nvim', tag = '*', config = "require('toggleterm-config')" }
use 'http://github.com/tpope/vim-surround' --" Surrounding ysw)
use 'http://github.com/tpope/vim-fugitive' --" Surrounding ysw)
use 'numToStr/Comment.nvim'
use 'https://github.com/vim-airline/vim-airline' --" Status bar
use 'https://github.com/rafi/awesome-vim-colorschemes' --" Retro Scheme
use 'https://github.com/ryanoasis/vim-devicons' --" Developer Icons
use 'https://github.com/preservim/tagbar' --" Tagbar for code navigation
use 'https://github.com/terryma/vim-multiple-cursors' --" CTRL + N for multiple 
use { "terrortylor/nvim-comment", config = "require('comment-config')" }
use {'jpalardy/vim-slime',  filetypes = {'python', 'julia'}}
use 'lervag/vimtex'
use { "folke/zen-mode.nvim", config = 'require("zen-mode-config")' }
use { "folke/twilight.nvim", config = "require('twilight-config')" }
use {"lukas-reineke/indent-blankline.nvim", config = function() require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
}) end }

use {
  'lewis6991/gitsigns.nvim',
  config = function()
	require('gitsigns').setup()
  end
}

use { "iamcco/markdown-preview.nvim",
	run = function() vim.fn["mkdp#util#install"]() end,}
if packer_bootstrap then
	require('packer').sync()
end

end)
