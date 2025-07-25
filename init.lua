require("config.lazy")
require("code_runner")
require("template_chooser")

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
local telescope_ok, telescope = pcall(require, 'telescope')
if telescope_ok then
  telescope.setup()
else
  print("Telescope not found! Please install telescope.nvim")
  return
end
-- Function to open input.txt and output.txt splits alongside current .cpp file
local function open_cpp_with_io()
  local ext = vim.fn.expand("%:e")
  if ext ~= "cpp" then return end

  -- Create input.txt and output.txt if missing
  local input_file = "input.txt"
  local output_file = "output.txt"
  if vim.fn.filereadable(input_file) == 0 then
    vim.fn.writefile({}, input_file)
  end
  if vim.fn.filereadable(output_file) == 0 then
    vim.fn.writefile({}, output_file)
  end

  -- Save current window number (code window)
  local code_win = vim.api.nvim_get_current_win()

  -- Open vertical split on the right with input.txt
  vim.cmd("vsplit " .. input_file)
  local input_win = vim.api.nvim_get_current_win()

  -- Go back to code window
  vim.api.nvim_set_current_win(code_win)

  -- Open horizontal split below with output.txt
  vim.cmd("split " .. output_file)

  -- Optional: set focus back to code window
  vim.api.nvim_set_current_win(code_win)
end

-- Autocmd to trigger the splits and file creation on opening .cpp files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.cpp",
  callback = function()
    -- Use defer to allow buffer to load properly
    vim.defer_fn(open_cpp_with_io, 100)
  end,
})

-- Optional keybinding to manually trigger split layout
vim.keymap.set("n", "<leader>io", open_cpp_with_io, { desc = "Open input/output splits" })
