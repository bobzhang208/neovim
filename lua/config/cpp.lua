-- File: ~/.config/nvim/lua/lspconfig/cpp.lua

local nvim_lsp = require('lspconfig')

nvim_lsp.clangd.setup{
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_dir = nvim_lsp.util.root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  ),
  capabilities = {
    offsetEncoding = { "utf-8" },
    -- other capabilities settings can go here
  },
  single_file_support = true
}

