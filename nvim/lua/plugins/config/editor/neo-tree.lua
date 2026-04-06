require("neo-tree").setup({
    default_component_configs = {
        last_modified = {
            format = "%Y-%m-%d %H:%M",
        },
    },
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        },
    },
})
