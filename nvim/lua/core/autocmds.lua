local augroup = vim.api.nvim_create_augroup("lsp/init.lua", {})

vim.api.nvim_create_user_command(
    "InitLua",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/init.lua")
    end,
    {}
)

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
    callback = function(ctx)
        pcall(vim.treesitter.start)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "neo-tree" },
    callback = function()
        require("ufo").detach()
        vim.opt_local.foldenable = false
    end,
})

vim.api.nvim_create_user_command(
    "LspHealth",
    "checkhealth vim.lsp",
    { desc = "LSP health check" }
)

vim.api.nvim_create_autocmd("LspAttach", {
    group = augroup,
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if client:supports_method("textDocument/definition") then
            vim.keymap.set("n", "grd", function()
                vim.lsp.buf.definition()
            end, { buffer = args.buf, desc = "vim.lsp.buf.definition()" })
        end

        if client:supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<space>i", function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end, { buffer = args.buf, desc = "Format buffer" })
        end
    end,
})
