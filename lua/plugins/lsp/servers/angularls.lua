local util = require("lspconfig.util")

return {
  root_dir = util.root_pattern("angular.json", "tsconfig.json", "package.json", "jsconfig.json", ".git"),
  settings = {
    angular = {
      -- Enable or disable specific features
      experimental = {
        ivysupport = true, -- Enable Ivy support
      },
      languageServer = {
        logFile = "/Users/alex.belost/.config/nvim/logs/angularls.log", -- Specify the log file location
        logVerbosity = "verbose", -- Set the log verbosity (can be "off", "normal", "verbose")
        logLevel = "info", -- Set the log level (can be "info", "warn", "error")
      },
    },
  },
}
