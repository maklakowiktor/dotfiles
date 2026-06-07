-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- nvim-lspconfig 
local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "gopls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
end

-- fortls init
lspconfig.fortls.setup{
  root_dir = "**/*",
  cmd = {
    'fortls',
    '--lowercase_intrinsics',
    '--hover_signature',
    '--hover_language=fortran23',
    '--use_signature_help',
    '--incremental_sync'
  },
  filetypes = {"fortran"},
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- tsserver
lspconfig.ts_ls.setup{
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.clangd.setup{
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  capabilities = nvlsp.capabilities
}

lspconfig.rust_analyzer.setup{
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
