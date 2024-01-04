vim.keymap.set('n', 'ff', function() require'pounce'.pounce {} end)
vim.keymap.set('x', 'ff', function() require'pounce'.pounce {} end)
vim.keymap.set('o', 'ff', function() require'pounce'.pounce {} end)
vim.keymap.set('n', 'FF', function() require'pounce'.pounce {do_repeat = true} end)
