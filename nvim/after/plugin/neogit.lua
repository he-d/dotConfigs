local neogit = require('neogit')
neogit.setup {}

vim.keymap.set("n", "mm", ':Neogit commit<CR>')

