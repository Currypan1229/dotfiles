local M = {}

function M.format_buf(buf)
    vim.lsp.buf.format({
        bufnr = buf,
        async = false,
    })
    if vim.bo[buf].modified then
        vim.api.nvim_buf_call(buf, function()
            vim.cmd("silent! write")
        end)
    end
end

function M.format_path(path, callback)
    if vim.fn.isdirectory(path) == 1 then
        for name, _ in vim.fs.dir(path) do
            M.format_path(vim.fs.joinpath(path, name), callback)
        end
    elseif vim.fn.filereadable(path) == 1 then
        local buf = vim.fn.bufnr(path)
        local new_buf = false
        if buf == -1 then
            buf = vim.fn.bufadd(path)
            vim.fn.bufload(buf)
            new_buf = true
        end
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modifiable then
            if callback then
                callback(path)
            end

            M.format_buf(buf)
            if new_buf then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end
end

return M
