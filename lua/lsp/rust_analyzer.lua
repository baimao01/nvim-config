require'lspconfig'.rust_analyzer.setup{
    filetypes = { "rust" },
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false;
            }
        }
    }
}
