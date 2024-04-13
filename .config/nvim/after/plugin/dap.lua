require('dap').adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode-14',
	name = 'lldb'
}

local lldb = {
	name = 'Launch lldb',
	type = 'lldb',
	request = 'launch',
	program = function ()
		return vim.fn.input(
			'Path to executable: ',
			vim.fn.getcwd() .. '/',
			'file'
			)
	end,
	cwd = '${workspaceFolder}',
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}

require('dap').configurations.rust = {lldb}

vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>dk', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>bp', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
