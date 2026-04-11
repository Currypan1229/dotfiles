local keys = {}

-- Top Pickers & Explorer
table.insert(keys, {
    "<leader><space>",
    function()
        Snacks.picker.smart()
    end,
    desc = "Smart Find Files",
})
table.insert(keys, {
    "<leader>:",
    function()
        Snacks.picker.command_history()
    end,
    desc = "Command History",
})
table.insert(keys, {
    "<leader>n",
    function()
        Snacks.picker.notifications()
    end,
    desc = "Notification History",
})
-- find
table.insert(keys, {
    "<leader>fb",
    function()
        Snacks.picker.buffers()
    end,
    desc = "Buffers",
})
table.insert(keys, {
    "<leader>fc",
    function()
        Snacks.picker.files({
            cwd = vim.fn.stdpath("config"),
        })
    end,
    desc = "Find Config File",
})
table.insert(keys, {
    "<leader>ff",
    function()
        Snacks.picker.files()
    end,
    desc = "Find Files",
})
table.insert(keys, {
    "<leader>fg",
    function()
        Snacks.picker.git_files()
    end,
    desc = "Find Git Files",
})
table.insert(keys, {
    "<leader>fp",
    function()
        Snacks.picker.projects()
    end,
    desc = "Projects",
})
table.insert(keys, {
    "<leader>fr",
    function()
        Snacks.picker.recent()
    end,
    desc = "Recent",
})
-- lazygit
table.insert(keys, {
    "<leader>ogg",
    function()
        Snacks.lazygit()
    end,
    desc = "Toggle LazyGit",
})
-- git
table.insert(keys, {
    "<leader>ogb",
    function()
        Snacks.picker.git_branches()
    end,
    desc = "Git Branches",
})
table.insert(keys, {
    "<leader>ogl",
    function()
        Snacks.picker.git_log()
    end,
    desc = "Git Log",
})
table.insert(keys, {
    "<leader>ogL",
    function()
        Snacks.picker.git_log_line()
    end,
    desc = "Git Log Line",
})
table.insert(keys, {
    "<leader>ogs",
    function()
        Snacks.picker.git_status()
    end,
    desc = "Git Status",
})
table.insert(keys, {
    "<leader>ogS",
    function()
        Snacks.picker.git_stash()
    end,
    desc = "Git Stash",
})
table.insert(keys, {
    "<leader>ogd",
    function()
        Snacks.picker.git_diff()
    end,
    desc = "Git Diff (Hunks)",
})
table.insert(keys, {
    "<leader>ogf",
    function()
        Snacks.picker.git_log_file()
    end,
    desc = "Git Log File",
})
-- gh
table.insert(keys, {
    "<leader>ogi",
    function()
        Snacks.picker.gh_issue()
    end,
    desc = "GitHub Issues (open)",
})
table.insert(keys, {
    "<leader>ogI",
    function()
        Snacks.picker.gh_issue({
            state = "all",
        })
    end,
    desc = "GitHub Issues (all)",
})
table.insert(keys, {
    "<leader>ogp",
    function()
        Snacks.picker.gh_pr()
    end,
    desc = "GitHub Pull Requests (open)",
})
table.insert(keys, {
    "<leader>ogP",
    function()
        Snacks.picker.gh_pr({
            state = "all",
        })
    end,
    desc = "GitHub Pull Requests (all)",
})
-- Grep
table.insert(keys, {
    "<leader>osb",
    function()
        Snacks.picker.lines()
    end,
    desc = "Buffer Lines",
})
table.insert(keys, {
    "<leader>osB",
    function()
        Snacks.picker.grep_buffers()
    end,
    desc = "Grep Open Buffers",
})
table.insert(keys, {
    "<leader>sg",
    function()
        Snacks.picker.grep()
    end,
    desc = "Grep",
})
table.insert(keys, {
    "<leader>sw",
    function()
        Snacks.picker.grep_word()
    end,
    desc = "Visual selection or word",
    mode = { "n", "x" },
})
-- search
table.insert(keys, {
    '<leader>s"',
    function()
        Snacks.picker.registers()
    end,
    desc = "Registers",
})
table.insert(keys, {
    "<leader>s/",
    function()
        Snacks.picker.search_history()
    end,
    desc = "Search History",
})
table.insert(keys, {
    "<leader>sC",
    function()
        Snacks.picker.commands()
    end,
    desc = "Commands",
})
table.insert(keys, {
    "<leader>sd",
    function()
        Snacks.picker.diagnostics()
    end,
    desc = "Diagnostics",
})
table.insert(keys, {
    "<leader>sD",
    function()
        Snacks.picker.diagnostics_buffer()
    end,
    desc = "Buffer Diagnostics",
})
table.insert(keys, {
    "<leader>sH",
    function()
        Snacks.picker.highlights()
    end,
    desc = "Highlights",
})
table.insert(keys, {
    "<leader>sk",
    function()
        Snacks.picker.keymaps()
    end,
    desc = "Keymaps",
})
table.insert(keys, {
    "<leader>sl",
    function()
        Snacks.picker.loclist()
    end,
    desc = "Location List",
})
table.insert(keys, {
    "<leader>sm",
    function()
        Snacks.picker.marks()
    end,
    desc = "Marks",
})
table.insert(keys, {
    "<leader>sp",
    function()
        Snacks.picker.lazy()
    end,
    desc = "Search for Plugin Spec",
})
table.insert(keys, {
    "<leader>sq",
    function()
        Snacks.picker.qflist()
    end,
    desc = "Quickfix List",
})
table.insert(keys, {
    "<leader>sR",
    function()
        Snacks.picker.resume()
    end,
    desc = "Resume",
})
table.insert(keys, {
    "<leader>su",
    function()
        Snacks.picker.undo()
    end,
    desc = "Undo History",
})
-- LSP
table.insert(keys, {
    "gd",
    function()
        Snacks.picker.lsp_definitions()
    end,
    desc = "Goto Definition",
})
table.insert(keys, {
    "gD",
    function()
        Snacks.picker.lsp_declarations()
    end,
    desc = "Goto Declaration",
})
table.insert(keys, {
    "gr",
    function()
        Snacks.picker.lsp_references()
    end,
    nowait = true,
    desc = "References",
})
table.insert(keys, {
    "gI",
    function()
        Snacks.picker.lsp_implementations()
    end,
    desc = "Goto Implementation",
})
table.insert(keys, {
    "gy",
    function()
        Snacks.picker.lsp_type_definitions()
    end,
    desc = "Goto T[y]pe Definition",
})
table.insert(keys, {
    "gai",
    function()
        Snacks.picker.lsp_incoming_calls()
    end,
    desc = "C[a]lls Incoming",
})
table.insert(keys, {
    "gao",
    function()
        Snacks.picker.lsp_outgoing_calls()
    end,
    desc = "C[a]lls Outgoing",
})
table.insert(keys, {
    "<leader>ss",
    function()
        Snacks.picker.lsp_symbols()
    end,
    desc = "LSP Symbols",
})
table.insert(keys, {
    "<leader>sS",
    function()
        Snacks.picker.lsp_workspace_symbols()
    end,
    desc = "LSP Workspace Symbols",
})
-- Zen
table.insert(keys, {
    "<leader>zen",
    function()
        Snacks.zen()
    end,
    desc = "Toggle Zen Mode",
})

return keys
