local opt = vim.opt
local g = vim.g

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.fileencoding = "utf-8"

opt.writebackup = false

opt.showmode = false
opt.clipboard = "unnamedplus"

opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.mouse = "a"

opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.termguicolors = true

opt.timeoutlen = 250

-- opt.cmdheight = 0

g.mapleader = " "

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

require("core.keymaps")
