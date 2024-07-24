-- lsp-config
-- https://github.com/neovim/nvim-lspconfig
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).

local lspconfig = require "lspconfig"

local lsp_flags = { debounce_text_changes = 150 }

local on_attach = require "config.lsp.handlers".on_attach
local capabilities = require "config.lsp.handlers".capabilities

-- language servers config

-- lua
local lua_ls_opts = require "config.lsp.settings.lua_ls"
lspconfig.lua_ls.setup
{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    -- lua_ls_opts
}

-- cmake
local cmake_opts = require "config.lsp.settings.cmake"
lspconfig.cmake.setup
{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    -- cmake_opts
}

-- cpp
local clangd_opts = require "config.lsp.settings.clangd"
lspconfig.clangd.setup
{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    clangd_opts
}

-- make
local make_opts = require "config.lsp.settings.autotools_ls"
lspconfig.autotools_ls.setup
{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    -- make_opts
}

-- assembly
local asm_lsp_opts = require "config.lsp.settings.asm_lsp"
lspconfig.asm_lsp.setup
{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    -- asm_lsp_opts
}

