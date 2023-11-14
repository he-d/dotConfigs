-- Load neogit with a protected call
local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
    return
end

neogit.setup {}

vim.keymap.set("n", "mm", ':Neogit commit<CR>')
