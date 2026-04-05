local keymap = vim.keymap
local kopts = { noremap = true, silent = true }

keymap.set("n", "<leader>sn", "<cmd>noh<cr>", kopts)

keymap.set("", "<f1>", function()
    local prof = package.loaded["profile"]
    if prof == nil then
        vim.notify("Profile.nvim is not loaded")
        return
    end

    local default_export_path = vim.fn.stdpath("data") .. "/profile.json"

    if prof.is_recording() then
        prof.stop()
        vim.ui.input(
            { prompt = "Save profile to:", completion = "file", default = default_export_path },
            function(filename)
                if filename then
                    prof.export(filename)
                    vim.notify(string.format("Wrote %s", filename))
                end
            end
        )
    else
        prof.start("*")
    end
end)

keymap.set("", "<leader>lf", function()
    local buf = vim.api.nvim_get_current_buf()
    local ft = vim.bo[buf].filetype

    local fmt = require("modules.formatter")
    if ft == "neo-tree" or ft == "netrw" then
        local path = nil
        if ft == "neo-tree" then
            local state = require("neo-tree.sources.manager").get_state("filesystem")
            local node = state.tree:get_node()

            if node then
                path = node:get_id()
            end
        elseif ft == "netrw" then
            local cur_dir = vim.b.netrw_curdir
            local cur_file = vim.fn.expand("<cfile>")

            if cur_file and cur_file ~= "" then
                path = vim.fs.joinpath(cur_dir, cur_file)
            end
        end

        if path == nil then
            return Snacks.notify.error("Formatting target was not found.")
        end

        Snacks.notify.info("Formatting.")
        fmt.format_path(path, nil)
    else
        if vim.bo[buf].modifiable then
            Snacks.notify.info("Formatting.")
            fmt.format_buf(buf)
        end
    end
end)
