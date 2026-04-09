local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ";" .. vim.env.PATH

local registry = require("mason-registry")

require("mason").setup({
    registries = {
        "file:" .. vim.fn.stdpath("config") .. "/mason-registry",
        "github:mason-org/mason-registry",
    },
})

local function install_rq()
    local yq_pkg = registry.get_package("yq")

    if not yq_pkg:is_installed() then
        yq_pkg:install()
        vim.wait(20000, function()
            return yq_pkg:is_installed()
        end, 100)
        registry.refresh()
    end
end

install_rq()
