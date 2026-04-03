local keymap = vim.keymap
local kopts = { noremap = true, silent = true }

keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- keymap.set({"i", "v", "x", "o", "t", "c"}, "<A-Space>", "<esc>")

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
