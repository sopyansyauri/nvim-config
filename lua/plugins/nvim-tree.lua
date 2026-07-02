return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup()

            -- Membuat shortcut
            -- vim.keymap.set("MODE", "TOMBOL_PINTAS", "PERINTAH", { desc = "DESKRIPSI" })
            
            -- =========================================================================
            -- FUNGSI KUSTOM SAAT PANEL NVIM-TREE TERBUKA
            -- =========================================================================
            local function my_on_attach(bufnr)
                local api = require("nvim-tree.api")

                -- 1. Muat semua tombol pintas bawaan Nvim-Tree standar
                api.config.mappings.default_on_attach(bufnr)

                -- 2. HAPUS fungsi bawaan Ctrl+t (Open in New Tab) agar tidak bentrok
                vim.keymap.del("n", "<C-t>", { buffer = bufnr })

                -- 3. PAKSA Ctrl+t di dalam Nvim-Tree untuk menjalankan perintah MURNI :NvimTreeClose
                vim.keymap.set("n", "<C-t>", "<cmd>NvimTreeClose<cr>", { buffer = bufnr, desc = "Menutup Nvim-Tree" })
            end

            -- =========================================================================
            -- SETUP UTAMA PLUGIN NVIM-TREE
            -- =========================================================================
            require("nvim-tree").setup({
                on_attach = my_on_attach, -- Hubungkan fungsi kustom kita di atas
                view = {
                    width = 20,
                    side = "left",
                },
            })

            -- =========================================================================
            -- SHORTCUT GLOBAL (SAAT KURSOR BERADA DI EDITOR KODE)
            -- =========================================================================
            -- Menggunakan NvimTreeToggle saat di luar agar tombol yang sama bisa otomatis membuka kembali
            vim.keymap.set("n", "<C-t>", "<cmd>NvimTreeToggle<cr>", { desc = "Membuka Nvim-Tree" })
        end,    }
    }
