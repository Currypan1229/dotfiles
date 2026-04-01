local wezterm = require 'wezterm'
local M = {}

---Terminal configuration module for WezTerm.
---@class TerminalConfig
---@field terminal string The terminal type (e.g., "pwsh", "powershell").
---@field customizer string The prompt customizer to use (e.g., "oh-my-posh", "starship").
---@field style string The style configuration for the customizer.
local TerminalConfig = {
    terminal = nil,
    customizer = nil, -- "oh-my-posh" or "starship"
    style = nil -- Style customize config for constomizer
}
TerminalConfig.__index = TerminalConfig

function M.create_config()
    local self = setmetatable({}, TerminalConfig)
    return self
end

function M.setup(config, wezter_config)
    wezterm.log_info("Setting up terminal configuration...")
    if config.terminal == nil then
        wezterm.log_error("Terminal type is not specified in the configuration.")
        return
    end

    if wezterm.target_triple == "x86_64-pc-windows-msvc" then
        if (config.customizer == "oh-my-posh") then
            local script_path = wezterm.config_dir .. "/terminal/scripts/oh-my-posh/powershell.ps1"
            local style_path = wezterm.config_dir .. "/terminal/styles/oh-my-posh/" .. config.style

            if config.terminal == "pwsh" or config.terminal == "powershell" then
                local exe = (config.terminal == "pwsh") and "pwsh.exe" or "powershell.exe"
                wezter_config.default_prog = {exe, "-NoExit", "-ExecutionPolicy", "Bypass", "-File", script_path,
                                              style_path}
            end
        elseif (config.customizer == "starship") then
            local script_path = wezterm.config_dir .. "/terminal/scripts/starship/powershell.ps1"
            local style_path = wezterm.config_dir .. "/terminal/styles/starship/" .. config.style

            if config.terminal == "pwsh" or config.terminal == "powershell" then
                local exe = (config.terminal == "pwsh") and "pwsh.exe" or "powershell.exe"

                wezterm.log_info("cmd: " .. exe .. " -NoExit -ExecutionPolicy Bypass -File " .. script_path .. " " ..
                                     style_path)

                wezter_config.default_prog = {exe, "-NoExit", "-ExecutionPolicy", "Bypass", "-File", script_path,
                                              style_path}
            end
        end
    end
end

return M
