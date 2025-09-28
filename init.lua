require("config.lazy")
require("code_runner")
require("template_chooser")
require("contest_timer")
require("contest_hud")

-- Set true midnight black theme
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Set all UI elements to pure black
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "#000000", fg = "#333333" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#000000", fg = "#444444" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000", fg = "#444444" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#000000", fg = "#ffffff" }) -- Brighter base text
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#404040", fg = "#00ffff", bold = true }) -- Selected item
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#262626" }) -- Scrollbar
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#5f5f5f" }) -- Brighter scrollbar
vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#ffffff" }) -- Brighter completion text
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#00ffff", bold = true }) -- Cyan matching chars
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#00ffff", bold = true }) -- Fuzzy matched chars
vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#ff80ff" }) -- Bright magenta for kind icons/text
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#80ffff" }) -- Light cyan for additional info
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#000000", fg = "#000000" })
vim.api.nvim_set_hl(0, "NonText", { fg = "#222222" })

-- Remove all background colors to ensure pure black
vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#000000" })

-- Basic settings
vim.opt.clipboard:append("unnamedplus")
vim.o.number = true

-- Toggle relative numbers
local numbertoggle_group = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
  group = numbertoggle_group,
  pattern = "*",
  command = "set norelativenumber",
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = numbertoggle_group,
  pattern = "*",
  command = "set relativenumber",
})

-- C++ LSP setup
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--suggest-missing-includes",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
})

-- Setup Telescope
local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
  telescope.setup()
else
  print("Telescope not found! Please install telescope.nvim")
  return
end

-- Autocmd to trigger the splits and file creation on opening .cpp files

vim.api.nvim_create_autocmd("CursorHoldI", {
  pattern = "*",
  callback = function()
    if vim.bo.modified then
      vim.cmd("silent! write")
    end
  end,
})
vim.o.updatetime = 501 -- 1 second idle time
-- Set commentstring for different filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.commentstring = "// %s"
  end,
})

-- Optional keybinding to manually trigger split layout

vim.keymap.set({ "n", "v" }, "<C-c>", '"+y', { noremap = true })

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =====================
-- VSCode-like mappings
-- =====================

-- Duplicate line up (Alt+Shift+Up)
map("n", "<A-S-Up>", "yypk", opts)
map("v", "<A-S-Up>", "y`>p`<k", opts)

-- Duplicate line down (Alt+Shift+Down)
map("n", "<A-S-Down>", "yyp", opts)
map("v", "<A-S-Down>", "y`>p`<", opts)

-- Ctrl+A = Select all
map("n", "<C-a>", "ggVG", opts)

-- Ctrl+C = Copy (in visual mode)
map("v", "<C-c>", '"+y', opts)

-- Ctrl+V = Paste
map({ "n", "v" }, "<C-v>", '"+p', opts)

-- Alt+Up = Move line up
map("n", "<A-Up>", ":m .-2<CR>==", opts)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- Alt+Down = Move line down
map("n", "<A-Down>", ":m .+1<CR>==", opts)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
