-- ~/.config/nvim/lua/template_chooser.lua

local M = {}

-- Fix template directory path
local templates_dir = "/home/lucifer/.config/nvim-dsa/templates/"

-- Function to determine the template directory based on file type
local function get_template_dir()
  local filetype = vim.bo.filetype
  local template_dir = templates_dir .. filetype
  -- Print debug info
  print("Looking for templates in: " .. template_dir)
  return template_dir
end

-- Function to read the content of a file
local function read_file(filepath)
  local file = io.open(filepath, "r")
  if not file then
    return nil
  end
  local content = file:read("*a")
  file:close()
  return content
end

-- Function to list and select a template
function M.choose_template()
  local template_dir = get_template_dir()
  if vim.fn.isdirectory(template_dir) == 0 then
    print("No templates found for filetype " .. vim.bo.filetype)
    return
  end

  require("telescope.builtin").find_files({
    prompt_title = "Choose Template",
    cwd = template_dir,
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local function on_select_template()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        local content = read_file(selection.path)
        if content then
          vim.fn.setreg("+", content)
          print("Template copied to clipboard")
        else
          print("Failed to read template")
        end
      end
      map("i", "<CR>", on_select_template)
      map("n", "<CR>", on_select_template)
      return true
    end,
  })
end
-- Set keybinding to choose template
vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  ':lua require("template_chooser").choose_template()<CR>',
  { noremap = true, silent = true, desc = "Choose Template" }
)

return M
