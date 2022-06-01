local lsp_servers = require("nvim-lsp-installer.servers")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")
local on_attach = require("user.lsp.handlers").on_attach

local function make_config(client_name)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  do end
  (capabilities.textDocument.completion.completionItem)["snippetSupport"] = true
  capabilities.textDocument.completion.completionItem["resolveSupport"] = { properties = { "documentation", "detail", "additionalTextEdits" } }
  local new_capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  local opts = { on_attach = on_attach, capabilities = new_capabilities, handlers = { ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }) } }
  if (client_name == "sumneko_lua") then
    opts["settings"] = { Lua = { diagnostics = { globals = { "vim" } } } }
  else
  end
  return opts
end

for _, lsp in ipairs(lsp_servers.get_installed_server_names()) do
  local lsp_server = lspconfig[lsp]
  lsp_server.setup(make_config(lsp))
end
