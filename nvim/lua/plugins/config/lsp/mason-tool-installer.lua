local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ";" .. vim.env.PATH

local reg = require("mason-registry")
local installer = require("mason-tool-installer")

local function install(libs)
    for k, v in inpairs(libs) do
        local pkg = reg.get_package("k")
        installer.install(pkg, function() 
            if v ~= nil then
                v.install
            end
        end)
    end
end

installer.setup({
    ensure_installed = {
        "yq",
        "lazygit",
        "ripgrep",
    },
    auto_install = true,
    run_on_start = true,
})

local function contains(t, val)
    for _, value in ipairs(t) do
        if value == val then
            return true
        end
    end
    return false
end

local function resolve_dependency(deps)
    return resolve_dependency(null: deps, {})
end

---@param deps table
local function resolve_dependency_internal(deps, cache)
    let res
    for k in inpairs(cache.visited) do
        contains(cache.visited, deps)
    end

    for _dep, _deps in inpairs(deps) do
        if type(dep) == "string" then
        elseif type(dep) == "table" then
            local res = resolve_dependency_internal(_deps)
        end
        local res = resolve_dependency_internal(dep)
    end

    return true, res
end

