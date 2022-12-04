vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- packer manages itself
	use 'wbthomason/packer.nvim'

	-- nerd tree
	use 'preservim/nerdtree'

    -- tagbar
    use 'preservim/tagbar'

	-- syntastic
	use 'vim-syntastic/syntastic'

	-- rust lang
	use 'rust-lang/rust.vim'

	-- coc language server
	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}

    -- markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- surround
    use 'tpope/vim-surround'

    -- commentary
    use 'tpope/vim-commentary'

    --- targets
    use 'wellle/targets.vim'

    -- pounce
    use 'rlane/pounce.nvim'

    --- colemak dh keymap
    use '~/.config/nvim/plugin/vim-colemak-dh'
end)
