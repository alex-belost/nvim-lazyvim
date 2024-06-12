return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } },
    },
  },
  opts = {
    -- format = require("plugins.lsp.format"),
    servers = require("plugins.lsp.servers"),
    -- setup = require("plugins.lsp.setup"),
    inlay_hints = { enabled = true },
  },
}
