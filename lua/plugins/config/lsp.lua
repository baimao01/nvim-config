return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function ()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜ ",
                        package_uninstalled = "✗",
                    },
                },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = "williamboman/mason-lspconfig.nvim",
        config = function ()
            local status, mason = pcall(require, "mason")
            if not status then
                vim.notify("没有找到 mason")
                return
            end

            local status, mason_config = pcall(require, "mason-lspconfig")
            if not status then
                vim.notify("没有找到 mason-lspconfig")
                return
            end

            local status, lspconfig = pcall(require, "lspconfig")
            if not status then
                vim.notify("没有找到 lspconfig")
                return
            end

            require("mason-lspconfig").setup({
                -- 确保安装，根据需要填写
                ensure_installed = {
                    -- "csharp_ls",
                    --"gopls",
                    --"rust_analyzer",
                    -- "omnisharp_mono",
                    "omnisharp",
                    "lua_ls",
                    --"clangd",
                },
            })

            local servers = {
                -- csharp_ls = require("lsp.config.csharp_ls"),
                --gopls = require("lsp.gopls"),
                --rust_analyzer = require("lsp.rust_analyzer"),
                -- omnisharp_mono = require("lsp.config.omnisharp_mono"),
                omnisharp = require("lsp.omnisharp"),
                lua_ls = require("lsp.lua_ls"),
                --clangd = require("lsp.config.clangd"),
            }

            for name, config in pairs(servers) do
                if config ~= nil and type(config) == "table" then
                    -- 自定义初始化配置文件必须实现on_setup 方法
                    config.on_setup(lspconfig[name])
                else
                    -- 使用默认参数
                    lspconfig[name].setup({})
                end
            end
        end
    },
    -- {
    --     event = "VeryLazy",
    --     "onsails/lspkind-nvim",
    -- }
}
