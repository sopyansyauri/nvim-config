return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable("clangd")
            vim.lsp.config("clangd",{
                filetypes = {
                    "c", "cpp", "objc", "objcpp", "cuda"
                }
            })
            -- --- CONFIG BAHASA PYTHON ---
            -- 1. Deteksi path Python & venv secara dinamis (Aman untuk Linux, macOS, dan Windows)
            local is_windows = vim.uv.os_uname().sysname:find("Windows") ~= nil
            local venv_path = os.getenv("VIRTUAL_ENV")
            local python_path = "python3"

            if venv_path then
                python_path = is_windows and (venv_path .. "\\Scripts\\python.exe") or (venv_path .. "/bin/python")
            end

            -- 2. Konfigurasi Pyright menggunakan format native Neovim 0.12
            vim.lsp.config("pyright", {
                -- Catatan: Pastikan variabel `capabilities` sudah diinisialisasi di atas kode ini
                settings = {
                    python = {
                        pythonPath = python_path, -- Menghubungkan Pyright ke Python milik venv Anda
                        -- analysis = {
                        --     completeFunctionSignatures = true,
                        --     autoSearchPaths = true,
                        --     useLibraryCodeForTypes = true,
                        --     diagnosticMode = "openFilesOnly",
                        -- },
                    },
                },
            })

            -- 3. Aktifkan Pyright
            vim.lsp.enable("pyright")


        end
    }
}
