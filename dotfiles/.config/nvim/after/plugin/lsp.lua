local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	enure_installed = {
		'rust-analyzer',
		'codelldb',
		'cpptools',
		'pyright',
	},
	handlers = {
		lsp.default_setup,
	}
})

require'lspconfig'.rust_analyzer.setup({
	settings = {
		['rust-analyzer'] = {
			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				allFeatures = true,
			},
			diagnostics = {
				enable = true,
			}
		}
	}
})

require'lspconfig'.pyright.setup({})

require'lspconfig'.lua_ls.setup {
    -- ... other configs
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
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-e>'] = cmp.mapping.select_prev_item(cmp_select),
		['<tab>'] = cmp.mapping.confirm({select = true}),
		['<C-Space>'] = cmp.mapping.complete(),
	})
})


vim.keymap.set('n', '<leader>do', function() vim.diagnostic.open_float() end)
vim.keymap.set('n', '<leader>dd', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<C-k>', function () vim.lsp.buf.hover() end)
