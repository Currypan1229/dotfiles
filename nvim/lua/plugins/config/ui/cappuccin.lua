require("catppuccin").setup({
    flavour = "frappe",
    auto_integrations = true,
    transparent_background = true,
    integrations = {
        barbar = true,
        colorful_winsep = { color = "lavender" },
        snacks = {
            enabled = true,
            indent_scope_color = "lavender"
        },
        neotree = { enabled = true }
    },
    custom_highlights = function(colors)
        return {
            NeoTreeFileStatsHeader = {
                fg = colors.subtext1
            },
            NeoTreeFileStats = {
                fg = colors.subtext0
            },

            NeoTreeMessage = {
                fg = colors.subtext0
            },

            CursorColumn = {
                bg = colors.sky
            }
        }
    end
})
