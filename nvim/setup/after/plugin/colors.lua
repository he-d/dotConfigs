-- Set the colorscheme and background colors
local function setColors(color)
    color = color or "onedark"
    vim.cmd("colorscheme " .. color)
    vim.o.background = ""
end

-- Set the background color for highlight groups
vim.api.nvim_set_hl(0, "Normal", { bg = "#343541" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Apply the colors
setColors()
