return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "rafamadriz/friendly-snippets",
    },
    config = function ()
        -- local lspkind = require('lspkind')
        local cmp = require'cmp'
        -- local kind_icons = {
        --     Text = "",
        --     Method = "m",
        --     Function = "",
        --     Constructor = "",
        --     Field = "",
        --     Variable = "",
        --     Class = "",
        --     Interface = "",
        --     Module = "",
        --     Property = "",
        --     Unit = "",
        --     Value = "",
        --     Enum = "",
        --     Keyword = "",
        --     Snippet = "",
        --     Color = "",
        --     File = "",
        --     Reference = "",
        --     Folder = "",
        --     EnumMember = "",
        --     Constant = "",
        --     Struct = "",
        --     Event = "",
        --     Operator = "",
        --     TypeParameter = "",
        -- }
        cmp.setup {
            -- 指定 snippet 引擎
            snippet = {
                expand = function(args)
                    -- For `vsnip` users.
                    --vim.fn["vsnip#anonymous"](args.body)

                    -- For `luasnip` users.
                    require('luasnip').lsp_expand(args.body)

                    -- For `ultisnips` users.
                    -- vim.fn["UltiSnips#Anon"](args.body)

                    -- For `snippy` users.
                    -- require'snippy'.expand_snippet(args.body)
                end,
            },
            -- 来源
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' },
                { name = 'buffer' },
                { name = 'path' }
            }),

            -- 快捷键
            mapping = require("core.keymaps").cmp(cmp),
            -- formatting = {
            --     format = function(_, item)
            --         local icons = require("lazyvim.config").icons.kinds
            --         if icons[item.kind] then
            --             item.kind = icons[item.kind] .. item.kind
            --         end
            --         return item
            --     end,
            -- },
        }

        -- Use buffer source for `/`.
        cmp.setup.cmdline('/', {
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':'.
        cmp.setup.cmdline(':', {
            -- mapping = require('keymaps').cmdline(cmdline),
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }},
                {{ name = 'cmdline' }})
        })
    end
}
