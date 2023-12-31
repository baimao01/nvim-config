return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "NeoTreeFloatToggle",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function ()
        require("neo-tree").setup()
    end
}
