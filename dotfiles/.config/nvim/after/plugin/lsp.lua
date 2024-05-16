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
		'black',
	},
	handlers = {
		lsp.default_setup,
	}
})

require('lspconfig').rust_analyzer.setup({
	settings = {
		['rust-analyzer'] = {
			cargo = {
				features = 'all',
				allFeatures = true,
				allTargets = true,
			},
			checkOnSave = {
				allFeatures = true,
			},
			diagnostics = {
				enable = true,
			},
		}
	}
})

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
		['<tab>'] = cmp.mapping.confirm({select = true}),
		['<C-Space>'] = cmp.mapping.complete(),
	})
})

vim.keymap.set('n', '<leader>do', function() vim.diagnostic.open_float() end)
vim.keymap.set('n', '<leader>dd', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<leader>df', function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set('n', '<leader>dw', function() require("trouble").toggle("workspace_diagnostics") end)

vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(event)
		local opts = { noremap = true, silent = true, buffer = event.bufnr }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	end
})
