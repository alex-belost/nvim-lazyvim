return {
  filetypes = { "php", "blade" },
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
    ["language_server_php_cs_fixer.enabled"] = false,
    ["language_server_php_cs_fixer.bin"] = "/usr/local/bin/php-cs-fixer",
    ["indexer.stub_paths"] = {
      "/Users/alex.belost/Projects/.helpers/php-stubs/acf-pro-stubs",
      "/Users/alex.belost/Projects/.helpers/php-stubs/wordpress-stubs",
    },
  },
}
