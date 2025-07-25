return {
  "neovim/nvim-lspconfig",
  opts = {
    -- Configure clangd with explicit offset encoding
    servers = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
      -- Disable ast_grep for C++ files
      ast_grep = {
        filetypes = {
          "c",
          "rust",
          "go",
          "java",
          "python",
          "javascript",
          "typescript",
          "html",
          "css",
          "kotlin",
          "dart",
          "lua",
        },
        -- Remove "cpp" from the list
      },
    },
  },
}
