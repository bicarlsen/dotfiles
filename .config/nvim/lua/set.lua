vim.g.mapleader = ","

vim.opt.termguicolors = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.colorcolumn = '81'
vim.opt.wrap = false

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- keep buffer lines when scrolling
vim.opt.scrolloff = 4

-- keep cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- tabs
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>')
vim.keymap.set('n', '<leader>to', '<cmd>tabonly<cr>')

-- don't copy over
vim.keymap.set('x', '<leader>p', '"_dP')

-- redo
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<F8>', '<cmd>TagbarToggle<cr>')

-- folding
vim.keymap.set('n', '<leader>zn', 'zj')
vim.keymap.set('n', '<leader>ze', 'ze')
vim.keymap.set('n', '<leader>zo', 'zo')
vim.keymap.set('n', '<leader>zc', 'zc')
vim.keymap.set('n', '<leader>zR', 'zR')
vim.keymap.set('n', '<leader>zM', 'zM')
