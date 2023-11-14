require("dap").adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode", -- adjust as needed
    name = "lldb",
}

local lldb = {
    name = "Launch lldb",
    type = "lldb",      -- matches the adapter
    request = "launch", -- could also attach to a currently running process
    program = function()
        return vim.fn.input("Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
        )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
}

require('dap').configurations.rust = {
    lldb -- different debuggers or more configurations can be used here
}

vim.keymap.set("n", "<F9>", vim.cmd.DapToggleBreakpoint)
vim.keymap.set("n", "<F5>", vim.cmd.DapContinue)
vim.keymap.set("n", "<F10>", vim.cmd.DapStepOver)
vim.keymap.set("n", "<F11>", vim.cmd.DapStepInto)
vim.keymap.set("n", "<F23>", vim.cmd.DapStepOut)
