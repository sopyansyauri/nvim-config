return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        prioriy = 1000,
        config = function()
            vim.cmd.colorscheme("tokyonight-night")

            vim.api.nvim_set_hl(0, "LineNr", {
                fg = "#f800f8", 
                bold = true,
            })

            vim.api.nvim_set_hl(0, "LineNrAbove", {
                fg = "#29b230"
            })
            vim.api.nvim_set_hl(0, "LineNrBelow", {
                fg = "#29b230"
            })


        end,
    }
}
