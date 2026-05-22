require("catppuccin").setup({
    flavour = "frappe",
    auto_integrations = true,
    transparent_background = os.getenv("TERM_PROGRAM") == "WezTerm" or os.getenv("SSH_CLIENT"),
    integrations = {
        barbar = true,
        colorful_winsep = { color = "lavender" },
        snacks = {
            enabled = true,
            indent_scope_color = "lavender",
        },
        neotree = { enabled = true },
    },
    float = {
        transparent = true,
        solid = true,
    },
    custom_highlights = function(colors)
        return {
            NeoTreeFileStatsHeader = {
                fg = colors.subtext1,
            },
            NeoTreeFileStats = {
                fg = colors.subtext0,
            },
            NeoTreeMessage = {
                fg = colors.subtext0,
            },

            NeoTreeGitIgnored = {
                fg = "#8c96aa"
            },
            NeoTreeIgnored = {
                fg = "#8c96aa"
            },
            NeoTreeDotfile = {
                --fg = "#737994"
                fg = "#8c96aa"
            },

            CursorColumn = {
                bg = colors.sky,
            },
        }
    end,
})
