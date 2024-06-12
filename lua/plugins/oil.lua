return {
  "stevearc/oil.nvim",
  opts = {},
  keys = {
    {
      "<leader>O",
      function()
        require("oil").open()
      end,
      desc = "Open folder in Oil",
    },
  },
}
