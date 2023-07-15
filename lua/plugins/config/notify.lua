return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        notify.setup({
            background_colour = "#000000",
            fps = 30,
            level = 2,
            minimum_width = 50,
            render = "compact",
            stages = "fade",
            timeout = 5000,
            top_down = true
        })
        vim.notify = notify
    end
}
