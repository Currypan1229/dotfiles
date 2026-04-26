local keys = {}

table.insert(keys, {
    "<leader>lr",
    vim.lsp.buf.rename,
    desc = "Rename field",
})

table.insert(keys, {
    "<leader>lsu",
    vim.lsp.buf.references,
    desc = "Show references",
})
table.insert(keys, {
    "<leader>ljd",
    vim.lsp.buf.definition,
    desc = "Jump to definition",
})
table.insert(keys, {
    "<leader>lji",
    vim.lsp.buf.declaration,
    desc = "Jump to declaration",
})
table.insert(keys, {
    "<leader>lje",
    vim.lsp.buf.implementation,
    desc = "Jump to implementation",
})
table.insert(keys, {
    "<leader>ljt",
    vim.lsp.buf.type_definition,
    desc = "Jump to type definition",
})

table.insert(keys, {
    "<leader>lh",
    vim.lsp.buf.hover,
    desc = "Hover",
})

table.insert(keys, {
    "<leader>lf",
    function()
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
    end,
    desc = "Format files",
})
return keys
