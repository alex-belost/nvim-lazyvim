return {
  on_new_config = function(config, root_dir)
    -- local arduino_binary = "/Users/alex.belost/go/bin/arduino-language-server"
    local arduino_binary = "arduino-language-server"
    local arduino_config = "/Users/alex.belost/Library/Arduino15/arduino-cli.yaml"

    local my_arduino_fqbn = {
      ["/Users/alex.belost/Projects/Arduino/SmartHome"] = "arduino:avr:mega",
    }

    local DEFAULT_FQBN = "arduino:avr:mega"
    local fqbn = my_arduino_fqbn[root_dir]

    if not fqbn then
      -- vim.notify(("Could not find which FQBN to use in %q. Defaulting to %q."):format(root_dir, DEFAULT_FQBN))
      fqbn = DEFAULT_FQBN
    end

    config.capabilities.textDocument.semanticTokens = vim.NIL
    config.capabilities.workspace.semanticTokens = vim.NIL

    config.cmd =
      { --  https://forum.arduino.cc/t/solved-errors-with-clangd-startup-for-arduino-language-server-in-nvim/1019977
        arduino_binary,
        "-cli-config",
        arduino_config,
        "-fqbn",
        fqbn,
        "-cli",
        "arduino-cli",
        "-clangd",
        "clangd",
        "-jobs",
        0,
      }
  end,
}
