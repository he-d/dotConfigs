local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
    return
end

neotree.setup({

    popup_border_style = "rounded",
    enable_git_status = true,
    --         enable_diagnostics = true,
    --         open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes

    indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        -- expander config, needed for nesting files
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
    },

    icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
        --           },

        modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
        },

        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },

        git_status = {
            symbols = {
                -- Change type
                added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "✖", -- this can only be used in the git_status source
                renamed   = "󰁕", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "󰄱",
                staged    = "",
                conflict  = "",
            }
        },
    },

    --         -- A list of functions, each representing a global custom command
    --         -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
    --         -- see `:h neo-tree-global-custom-commands`
    --           follow_current_file = false, -- This will find and focus the file in the active buffer every
    --                                        -- time the current file is changed while the tree is open.
    group_empty_dirs = false,            -- when true, empty folders will be grouped together
    --                                           -- instead of relying on nvim autocmd events.

})

vim.keymap.set("n", "<leader>e", vim.cmd.NeoTreeRevealToggle)
