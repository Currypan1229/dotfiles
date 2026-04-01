require("render-markdown").setup({
    checkbox = {
        checked = { scope_highlight = "@markup.strikethrough" },
        custom = {
            -- Unmark "[-]" as a ToDo item.
            todo = { raw = "", rendered = "", highlight = "" },
            canceled = {
                raw = "[-]",
                rendered = "󱘹",
                scope_highlight = "@markup.strikethrough",
            },
        },
    },
})
