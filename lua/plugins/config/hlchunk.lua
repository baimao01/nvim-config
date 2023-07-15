local filetypes = {
    "*.ts",
    "*.tsx",
    "*.js",
    "*.jsx",
    "*.html",
    "*.json",
    "*.go",
    "*.c",
    "*.cs",
    "*.cpp",
    "*.rs",
    "*.h",
    "*.hpp",
    "*.lua",
    "*.vue",
}
return {
    {
        "shellRaining/hlchunk.nvim",
        event = "BufReadPre",
        config = function ()
            require('hlchunk').setup({
                chunk = {
                    chars = {
                        horizontal_line = "─",
                        vertical_line = "│",
                        left_top = "┌",
                        left_bottom = "└",
                        right_arrow = ">",
                    },
                    support_filetypes = filetypes,
                },
                line_num = {
                    support_filetypes = filetypes,
                },
                indent = {
                    --chars = {
                    --    "│",
                    --},
                    --style = {
                    --    --vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                    --    "#444444"
                    --},
                    --support_filetypes = filetypes,
                    enable = false,
                },
                blank = {
                    enable = false,
                }
            })
        end
    }
}
