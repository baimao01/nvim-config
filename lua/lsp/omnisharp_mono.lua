local lspconfig = require "lspconfig"

lspconfig.omnisharp_mono.setup {
    cmd = { "dotnet", "omnisharp-mono" }
}
