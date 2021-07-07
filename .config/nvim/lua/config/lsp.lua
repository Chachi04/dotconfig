-- Lua
local system_name = "Linux"
local sumneko_root_path = "/home/chachi/.local/share/nvim/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

require "lspconfig".sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            },
            completion = {
                callSnippet = 2,
                enable = true
            }
        }
    }
}

--

-- Diagnostics

-- use the same configuration you would use for `vim.lsp.diagnostic.on_publish_diagnostics`.
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    require("lsp_extensions.workspace.diagnostic").handler,
    {
        signs = {
            severity_limit = "Error"
        }
    }
)

-- Get the counts from your curreent workspace:
local ws_errors = require("lsp_extensions.workspace.diagnostic").get_count(0, "Error")
local ws_hints = require("lsp_extensions.workspace.diagnostic").get_count(0, "Hint")

-- Set the qflist for the current workspace
--  For more information, see `:help vim.lsp.diagnostic.set_loc_list()`, since this has some of the same configuration.
if (ws_errors ~= 0 or ws_hints ~= 0) then
    require("lsp_extensions.workspace.diagnostic").set_qf_list()
-- print("has err or hints")
end