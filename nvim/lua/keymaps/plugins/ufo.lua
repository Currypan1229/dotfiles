local keys = {}

table.insert(keys, {
    "zR",
    function()
        require("ufo").openAllFolds()
    end,
    desc = "Open all folds",
})
table.insert(keys, {
    "zM",
    function()
        require("ufo").closeAllFolds()
    end,
    desc = "Close all folds",
})

return keys
