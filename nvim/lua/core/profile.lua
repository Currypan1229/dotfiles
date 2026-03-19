local should_profile = os.getenv("NVIM_PROFILE")

if should_profile then
    vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/profile.nvim")

    require("profile").instrument_autocmds()
    if should_profile:lower():match("^start") then
        require("profile").start("*")
    else
        require("profile").instrument("*")
    end
end
