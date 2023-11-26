local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
    return
end

tmux.setup{}

vim.keymap.set("n", "<C-h>", ':TmuxNavigateLeft<CR>')
vim.keymap.set("n", "<C-l>", ':TmuxNavigateRight<CR>')
vim.keymap.set("n", "<C-j>", ':TmuxNavigateDown<CR>')
vim.keymap.set("n", "<C-k>", ':TmuxNavigateUp<CR>')