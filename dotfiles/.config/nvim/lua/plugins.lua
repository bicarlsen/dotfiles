vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- packer manages itself
	use 'wbthomason/packer.nvim'

	-- nerd tree
	use 'preservim/nerdtree'

	-- syntastic
	use 'vim-syntastic/syntastic'

	-- rust lang
	use 'rust-lang/rust.vim'

	-- coc language server
	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}
end)
