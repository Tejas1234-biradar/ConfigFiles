-- ~/.config/nvim/lua/code_runner.lua

local Terminal = require("toggleterm.terminal").Terminal

-- Function to determine the run command based on file type
local function get_run_command()
  local filetype = vim.bo.filetype
  local file = vim.fn.expand("%:p") -- get full path of the file
  local output = vim.fn.expand("%:p:r") -- get full path of the output without extension
  local cmd = ""

  if filetype == "cpp" then
    cmd = string.format("g++ -std=c++11 -O2 -Wall %s -o %s.bin && %s.bin", file, output, output)
  elseif filetype == "c" then
    cmd = string.format("gcc %s -o %s.bin && %s.bin", file, output, output)
  elseif filetype == "python" then
    cmd = string.format("python3 %s", file)
  elseif filetype == "javascript" then
    cmd = string.format("node %s", file)
  elseif filetype == "typescript" then
    cmd = string.format("ts-node %s", file)
  elseif filetype == "go" then
    cmd = string.format("go run %s", file)
  elseif filetype == "rust" then
    cmd = string.format("rustc %s && %s", file, output)
  else
    print("No run command configured for filetype " .. filetype)
    return nil
  end

  return cmd
end

-- Function to run the command in a terminal
local function run_code()
  local cmd = get_run_command()
  if cmd then
    local term = Terminal:new({
      cmd = cmd,
      close_on_exit = false,
      direction = "horizontal",
    })
    term:toggle()
  end
end

-- Set keybinding to run code
vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  ':lua require("code_runner").run_code()<CR>',
  { noremap = true, silent = true, desc = "Run code" }
)

return {
  run_code = run_code,
}
