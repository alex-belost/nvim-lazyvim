return {
  filetypes = {
    "css",
    "eruby",
    "html",
    "htmldjango",
    "javascriptreact",
    "less",
    "pug",
    "sass",
    "scss",
    "php",
    "typescriptreact",
  },
  init_options = {
    preferences = {
      ["bem.elementSeparator"] = "__",
      ["bem.modifierSeparator"] = "--",
      ["bem.shortElementPrefix"] = "-",
    },
    showexpandedabbreviation = "always",
    showabbreviationsuggestions = true,
    showsuggestionsassnippets = false,
    syntaxProfiles = {
      html = {
        filters = "bem",
      },
    },
    variables = {},
    excludelanguages = {},
  },
}
