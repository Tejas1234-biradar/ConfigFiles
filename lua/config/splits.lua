-- Auto split and prepare input/output files
local function open_cpp_with_io()
  local file = vim.fn.expand("%:t")
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

  -- Open splits
  vim.cmd("vsplit " .. input_file)
  vim.cmd("split " .. output_file)
end
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.cpp",
  callback = function()
    vim.defer_fn(open_cpp_with_io, 100)
  end,
})
