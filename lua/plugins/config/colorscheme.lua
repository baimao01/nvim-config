return {
    {
        "catppuccin/nvim",
        -- lazy = true,
        name = "catppuccin",
        config = function ()
            vim.cmd([[colorscheme catppuccin]])
        end,
    }
}
