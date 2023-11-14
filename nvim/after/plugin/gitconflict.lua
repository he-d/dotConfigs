-- Load gitconflict with a protected call
local status_ok, gitconflict = pcall(require, "gitconflict")
if not status_ok then
    return
end

gitconflict.setup
{
    default_mappings = false,   -- disable buffer local mapping created by this plugin
    default_commands = true,    -- disable commands created by this plugin
    disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
    list_opener = 'copen',      -- command or function to open the conflicts list
    highlights = {              -- They must have background color, otherwise the default color will be used
        incoming = 'DiffAdd',
        current = 'DiffText',
    }
}

vim.keymap.set("n", "<leader>q", ':GitConflictListQf<CR>')

vim.keymap.set('n', 'co', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', 'ct', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', 'cb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', 'c0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', 'cx', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', 'cy', '<Plug>(git-conflict-next-conflict)')
