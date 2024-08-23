return {
  filetypes = {
    "c",
    "cpp",
    "objc",
    "objcpp",
    "cuda",
    "proto",
    "arduino",
  },
  cmd = { "clangd" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
}
