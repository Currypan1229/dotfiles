local keymap = require("keymaps.keymaps")
local kopts = { noremap = true, silent = true }

keymap.set("n", "<leader>sn", "<cmd>noh<cr>", kopts)

keymap.set("n", "<leader>wqp", function()
    vim.api.nvim_buf_delete(0, {})
end, {
    desc = "Window quit if possible",
})
keymap.set("n", "<leader>wqf", function()
    vim.api.nvim_buf_delete(0, { force = true })
end, {
    desc = "Window write quit force",
})
keymap.set("n", "<leader>wwq", function()
    vim.api.nvim_buf_call(0, function()
        vim.cmd("write")
    end)

    vim.api.nvim_buf_delete(0, {})
end)

-- Profile.nvim

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
