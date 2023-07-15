return {
    {
        'akinsho/bufferline.nvim',
        event = "VeryLazy",
        config = function ()
            require("bufferline").setup {
                options = {
                    -- 使用 nvim 内置lsp
                    diagnostics = "nvim_lsp",
                    -- 左侧让出 nvim-tree 的位置
                    offsets = {{
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                    }},
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local s = " "
                        for e, n in pairs(diagnostics_dict) do
                            local sym = e == "error" and " "
                            or (e == "warning" and " " or "" )
                            s = s .. n .. sym
                        end
                        return s
                    end,
                    -- mode = "tabs",
                    -- separator_style = "slant",
                    buffer_close_icon = "",
                    modified_icon = "●",
                    close_icon = "",
                    right_mouse_command = "bdelete! %d",
                    left_mouse_command = "buffer %d",
                    left_trunc_marker = "",
                    right_trunc_marker = ""
                }
            }
        end,
    }
}
