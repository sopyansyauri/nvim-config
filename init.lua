vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true   -- Mengubah Tab menjadi karakter spasi biasa
vim.opt.shiftwidth = 4     -- Lebar indentasi otomatis (saat menggunakan tombol > atau <)
vim.opt.tabstop = 4        -- Lebar visual untuk karakter tab asli jika tidak sengaja terbaca
vim.opt.softtabstop = 4    -- Lompatan Tab dan Backspace sejauh 4 spasi
vim.opt.smarttab = true    -- Mengaktifkan fitur pintar di awal baris
vim.opt.autoindent = true -- Otomatis menyalin indentasi ke baris baru saat Enter
vim.opt.mouse = "i" -- Mengaktifkan kontrol mouse sepenuhnya di semua mode

require("config.lazy")

-- Konfigurasi LSP untuk menghubungkan dengan bahasa pemograman C
-- vim.lsp.enable('clangd')
