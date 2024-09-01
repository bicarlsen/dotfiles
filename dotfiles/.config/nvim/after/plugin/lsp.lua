local lsp = require('lsp-zero')

require("mason").setup({})
require("mason-lspconfig").setup({
	enure_installed = {
		'cpptools',
		'pyright',
		'black',
		'tsserver',
	},
	handlers = {
		lsp.default_setup,
	}
})

vim.g.rustfmt_autosave = 1
require('lspconfig').rust_analyzer.setup({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
	settings = {
		['rust-analyzer'] = {
			cargo = {
				features = 'all',
				allTargets = true,
			},
			rustfmt = {
				overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
			},
		}
	}
})

require('lspconfig').tsserver.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}

-- autocomplete selection
local cmp = require('cmp')
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<tab>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	})
})

vim.keymap.set('n', '<leader>do', function() vim.diagnostic.open_float() end)
vim.keymap.set('n', '<leader>dd', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<leader>dw', function() require("trouble").toggle("diagnostics") end)
vim.keymap.set('n', '<leader>df',
	function() require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } }) end)
vim.keymap.set('n', '<leader>cx', '<cmd>TSContextToggle<cr>')

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)


-- format on save
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", {}),
	callback = function(args)
		local keymap_opts = { noremap = true, silent = true, buffer = args.bufnr }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format { async = false, id = args.data.client_id }
			end,
		})
	end
})
