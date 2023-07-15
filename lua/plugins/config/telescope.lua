return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
        config = function ()
            local actions = require('telescope.actions')
            require('telescope').setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = "move_selection_previous",
                            ["<C-j>"] = "move_selection_next",
                            ["<C-h>"] = "preview_scrolling_up",
                            ["<C-l>"] = "preview_scrolling_down"
                        }
                    },
                    color_devicons = true,
                    prompt_prefix = "🔍 ",
                    selection_caret = ""
                },
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_lastused = true,
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                        }
                    },
                    find_files = {
                        theme = "ivy",
                    }
                },
                extensions = {
                    command_palette = command_palette
                }
            })
            require('dressing').setup({
                select = {
                    get_config = function(opts)
                        if opts.kind == 'codeaction' then
                            return {
                                backend = 'telescope',
                                telescope = require('telescope.themes').get_cursor()
                            }
                        end
                    end
                }
            })
        end
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    }
}
