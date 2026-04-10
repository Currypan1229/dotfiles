return {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    version = "2.*",
    keys = {
        {
            "<leader>ow",
            function()
                require("window-picker").pick_window()
            end,
        },
    },
    config = true,
}
