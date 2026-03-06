vim.api.nvim_create_user_command(
    "InitLua",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/init.lua")
    end,
    {}
)

vim.api.nvim_create_autocmd("FileType", {
--    pattern = { "<filetype>" },
    group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
    callback = function(ctx)
        pcall(vim.treesitter.start)
    end,
})
