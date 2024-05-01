return {
	'preservim/tagbar',
	'vim-syntastic/syntastic',
	'tpope/vim-surround',
	'tpope/vim-commentary',
	'tpope/vim-fugitive',
	'wellle/targets.vim',
	'rlane/pounce.nvim',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'mfussenegger/nvim-dap',
	'theHamsta/nvim-dap-virtual-text',
	'simrat39/rust-tools.nvim',
	{
		'rust-lang/rust.vim',
		ft = 'rust',
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},
	{'catppuccin/nvim', name = 'catppuccin'},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/nvim-cmp',
			'L3MON4D3/LuaSnip',
		}
	},
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		lazy = false,
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {'nvim-lua/plenary.nvim'},
		lazy = false,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		config = function()
			require("neo-tree").setup({
				window = {
					position = "right",
					mappings = {
						["n"] = "noop",
						["e"] = "noop",
					}
				},
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},
			})
		end
	},
	{
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		}
	},
}
