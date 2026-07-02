return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Memuat ikon Nerd Font FiraCode
    opts = {}, -- Menggunakan konfigurasi default bawaan trouble.nvim
    init = function()
        -- =========================================================================
        -- 1. KONFIGURASI TANDA ERROR DI PINGGIR LAYAR (CARA BARU & MODERN)
        -- =========================================================================

        -- Definisikan tabel ikon menggunakan kode unicode yang aman untuk Python
        local diagnostic_icons = {
            [vim.diagnostic.severity.ERROR] = "\u{f057}", -- Ikon Silang Merah (F057)
            [vim.diagnostic.severity.WARN]  = "\u{f071}", -- Ikon Segitiga Kuning (F071)
            [vim.diagnostic.severity.HINT]  = "\u{f0eb}", -- Ikon Lampu Ide
            [vim.diagnostic.severity.INFO]  = "\u{f05a}", -- Ikon Informasi (F05A)
        }

        vim.diagnostic.config({
            underline = true,         -- Memberi garis bawah bergelombang pada kode yang error
            update_in_insert = false, -- Jangan update tanda saat sedang mengetik (biar tidak lag)
            severity_sort = true,     -- Mengurutkan dari yang paling parah (Error dulu)
            virtual_text = {
                spacing = 4,           -- Jarak spasi dari akhir baris kode ke teks error
                severity_sort = true,  -- Dahulukan Error merah daripada Warning kuning
                -- Fungsi di bawah ini yang bertugas memunculkan ikon sesuai tingkat error
                prefix = function(diagnostic)
                    local icon = diagnostic_icons[diagnostic.severity]
                    return icon and (icon .. " ") or "● "
                end,
            },
            -- 2. MENDAFTARKAN IKON MENGGUNAKAN KODE UNICODE ESCAPE (\u{xxxx})
            -- Cara ini 100% aman dan tidak akan memicu 'Invalid sign_text' pada Python LSP
            signs = diagnostic_icons,
        })

        -- =========================================================================
        -- PINTASAN TOMBOL (KEYMAPS) TROUBLE.NVIM
        -- =========================================================================

        -- Tekan 'xx' untuk melihat semua error di proyek Anda
        vim.keymap.set("n", "xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })

        -- Tekan 'xd' untuk melihat error hanya di file yang sedang aktif
        vim.keymap.set("n", "xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })

        -- Tekan 'xl' untuk melihat lokasi error saat ini
        vim.keymap.set("n", "xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })

        -- Tekan 'xq' untuk melihat quickfix list
        vim.keymap.set("n", "xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
    end,
}

