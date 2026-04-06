local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ";" .. vim.env.PATH

local registry = require("mason-registry")
local installer = require("mason-tool-installer")

installer.setup({
    ensure_installed = {},
    run_on_start = true,
})

local function install(apps)
    local yq_pkg = registry.get_package("yq")
    yq_pkg:install()

    if not yq_pkg:is_installed() then
        vim.wait(20000, function()
            return yq_pkg:is_installed()
        end, 100)
    end

    registry.refresh()

    for _, pkg_name in ipairs(apps) do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok then
            pkg:install()
        else
            error(pkg_name .. " was not found.")
        end
    end
end

install({
    "lazygit",
    "ripgrep",
})
