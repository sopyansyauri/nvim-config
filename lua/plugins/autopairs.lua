return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter", -- Lazy load: Hanya dimuat saat mulai mengetik
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true, -- Mengaktifkan integrasi Treesitter untuk akurasi lebih baik
                ts_config = {
                    lua = { "string" }, -- Jangan pasang autopair di dalam string file Lua
                    javascript = { "template_string" },
                },
                -- Mengabaikan autopair jika kursor berada tepat di depan karakter tertentu
                disable_filetype = { "TelescopePrompt", "spectre_panel" },
            })
        end
    }
}
