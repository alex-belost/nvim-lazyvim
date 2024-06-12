return {
  "nvim-snippets",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    friendly_snippets = true,
    extended_filetypes = {
      typescript = { "javascript", "tsdoc" },
      javascript = { "jsdoc" },
      html = { "css", "javascript" },
      scss = { "css" },
      lua = { "luadoc" },
      python = { "python-docstring" },
      java = { "javadoc", "java-testing" },
      sh = { "shelldoc" },
      php = { "phpdoc" },
      ruby = { "rdoc" },
      quarto = { "markdown" },
      rmarkdown = { "markdown" },
    },
  },
}
