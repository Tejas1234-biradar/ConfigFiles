-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<C-q>", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- You can also bind it in terminal mode
vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>jr",
  ":CompetiTest run<CR>",
  { noremap = true, silent = true, desc = "Run tests" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>jc",
  ":CompetiTest receive contest<CR>",
  { noremap = true, silent = true, desc = "Receive contest" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>jp",
  ":CompetiTest receive problem<CR>",
  { noremap = true, silent = true, desc = "Receive problem" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>jt",
  ":CompetiTest receive testcases<CR>",
  { noremap = true, silent = true, desc = "Receive testcase" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>ja",
  ":CompetiTest add_testcase<CR>",
  { noremap = true, silent = true, desc = "add_testcase" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>je",
  ":CompetiTest edit_testcase<CR>",
  { noremap = true, silent = true, desc = "edit_testcase" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>jd",
  ":CompetiTest delete_testcase<CR>",
  { noremap = true, silent = true, desc = "delete_testcase" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>ju",
  ":CompetiTest show_ui<CR>",
  { noremap = true, silent = true, desc = "show_ui" }
)
