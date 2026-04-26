local M = {}

function M.format_buf(buf)
    vim.lsp.buf.format({
        bufnr = buf,
        async = false,
    })
    
    local is_modified = false
    vim.wait(500, function()
        is_modified = vim.api.nvim_get_option_value("modified", { buf = buf })
        return is_modified
    end, 75)

    if is_modified then
        vim.api.nvim_buf_call(buf, function()
            vim.cmd("silent! write")
        end)
    end
end

local function collect_files(path)
    local files = {}

    local target_paths = { path }
    while #target_paths ~= 0 do
        local new_target_paths = {}

        for _, target_path in ipairs(target_paths) do
            if vim.fn.isdirectory(target_path) == 1 then
                for name, _ in vim.fs.dir(target_path) do
                    table.insert(new_target_paths, vim.fs.joinpath(target_path, name))
                end
            else
                table.insert(files, target_path)
            end
        end

        target_paths = new_target_paths
    end

    return files
end

function M.format_path(path, callback)
    local files = collect_files(path)

    for _, file in ipairs(files) do
        if vim.fn.filereadable(file) == 1 then
            local buf = vim.fn.bufnr(file)
            local new_buf = false
            if buf == -1 then
                buf = vim.fn.bufadd(file)
                vim.fn.bufload(buf)
                new_buf = true
            end
            if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modifiable then
                if callback then
                    callback(file)
                end

                M.format_buf(buf)
                if new_buf then
                    vim.api.nvim_buf_delete(buf, { force = true })
                end
            end
        end
    end
end

return M
