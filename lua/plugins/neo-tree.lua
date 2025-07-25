return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      window = {
        position = "left",
        width = 20,
      },
      default_component_configs = {
      },
    })
  end,
}
