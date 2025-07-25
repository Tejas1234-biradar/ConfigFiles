-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- -- Force consistent encoding for all clients
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  callback = function(ev)
    -- Set encoding for all future clients that attach
    vim.api.nvim_create_autocmd("LspAttach", {
      buffer = ev.buf,
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          client.offset_encoding = "utf-8"
        end
      end,
    })

    -- Set encoding for already attached clients
    for _, client in ipairs(vim.lsp.get_active_clients({ buffer = ev.buf })) do
      client.offset_encoding = "utf-8"
    end
  end,
})
