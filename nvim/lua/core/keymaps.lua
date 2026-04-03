local keymap = vim.keymap
local kopts = { noremap = true, silent = true }

keymap.set("n", "<Leader>l", "<Cmd>noh<CR>", kopts)

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
