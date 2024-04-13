local mocha = require("catppuccin.palettes").get_palette "mocha"

vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, 'LineNr', {fg=mocha.green})
vim.api.nvim_set_hl(0, 'LineNrAbove', {fg=mocha.red})
vim.api.nvim_set_hl(0, 'LineNrBelow', {fg=mocha.blue})
