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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'itchyny/lightline.vim'
	use 'duane9/nvim-rg'
	use 'edkolev/tmuxline.vim'
	use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'mengelbrecht/lightline-bufferline' 
	
	use {
	  "nvim-telescope/telescope-file-browser.nvim",
	  requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}
	
  use 'ryanoasis/vim-devicons'
	
	  use({

				  'rose-pine/neovim',

						  as = 'rose-pine',

								  config = function()

												  vim.cmd('colorscheme rose-pine')

														  end
															  })



  use 'mhinz/vim-startify'
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
