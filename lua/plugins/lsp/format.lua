
return {
  filter = function(client)
    if vim.bo.filetype == "php" then
      return client.name == "intelphense"
    end

    return true
  end,
}
