return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")

            -- Ambil kemampuan default dari cmp-nvim-lsp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- CARA BARU (Neovim 0.11+): Setup LSP C (clangd) menggunakan API Native
            vim.lsp.config("clangd", {
                capabilities = capabilities,
            })

            -- Aktifkan secara resmi agar berjalan otomatis saat membuka file C
            vim.lsp.enable("clangd")

            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            vim.lsp.enable('pyright')

            -- Setup nvim-cmp
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, 
                }),
            })
        end,

    }
}
