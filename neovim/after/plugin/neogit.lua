local neogit = require('neogit')
neogit.setup {}

vim.keymap.set("n", "cc", ':Neogit commit<CR>')

