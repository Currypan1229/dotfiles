local should_profile = os.getenv("NVIM_PROFILE")

if should_profile then
    vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/profile.nvim")
    local prof = require("profile")

    prof.instrument_autocmds()
    if should_profile:lower():match("^start") then
        prof.start("*")
    else
        prof.instrument("*")
    end
end
