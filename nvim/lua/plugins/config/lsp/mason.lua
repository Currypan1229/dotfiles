require("mason").setup({
    registries = {
        "file:" .. vim.fn.stdpath("config") .. "/mason-registry",
        "github:mason-org/mason-registry",
    }
})
