local keymap = require("keymaps.keymaps")
local kopts = { noremap = true, silent = true }

local treesitter_context = require("treesitter-context")

keymap.set("n", "[c", function()
    treesitter_context.go_to_context(vim.v.count1)
end, { silent = true })

keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})

keymap.set("n", "zR", [[<Cmd>lua require("ufo").openAllFolds()<CR>]], kopts)
keymap.set("n", "zM", [[<Cmd>lua require("ufo").closeAllFolds()<CR>]], kopts)

keymap.set("n", "<leader>ss", ":Namu symbols<cr>", {
    desc = "Jump to LSP symbol",
    silent = true,
})
keymap.set("n", "<leader>sw", ":Namu workspace<cr>", {
    desc = "LSP Symbols - Workspace",
    silent = true,
})

keymap.set("n", "n", [[<Cmd>execute("normal! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "N", [[<Cmd>execute("normal! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "*", [[*<Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "#", [[#<Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "g*", [[g*<Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "g#", [[g#<Cmd>lua require("hlslens").start()<CR>]], kopts)

keymap.set("n", "<Leader>l", "<Cmd>noh<CR>", kopts)

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
