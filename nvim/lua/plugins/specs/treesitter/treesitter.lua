return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
    },
    cmd = {
        "TSBufDisable",
        "TSBufEnable",
        "TSBufToggle",
        "TSDisable",
        "TSEnable",
        "TSToggle",
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSModuleInfo",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
    },
    build = {
        ":TSUpdate",
    },
    config = function()
        require("plugins.config.treesitter.treesitter")
    end,
}
