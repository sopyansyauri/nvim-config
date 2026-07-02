return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "python",
                    "c",
                    "cpp",
                    "bash",
                    "json",
                },
                highlight = {
                    enable = true,
                }
            })
        end
    }
}
