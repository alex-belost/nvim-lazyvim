return {
  "epwalsh/obsidian.nvim",
  version = "*",
  event = "VeryLazy",
  ft = "markdown",
  keys = {
    {
      "<leader>oo",
      "<cmd>ObsidianOpen<cr>",
      desc = "Open note",
    },
    {
      "<leader>on",
      "<cmd>ObsidianNew<cr>",
      desc = "New note",
    },
    {
      "<leader>ot",
      "<cmd>ObsidianTemplate<cr>",
      desc = "Insert template",
    },
    {
      "<leader>oT",
      "<cmd>ObsidianToday<cr>",
      desc = "Today note",
    },
    {
      "<leader>oY",
      "<cmd>ObsidianYesterday<cr>",
      desc = "Yesterday note",
    },
    {
      "<leader>ol",
      "<cmd>ObsidianLink<cr>",
      desc = "Make a link",
    },
    { "<leader>oL", "<cmd>ObsidianLinkNew<cr>" },
    -- {
    --   "<leader>ob",
    --   "<cmd>ObsidianBacklinks<cr>",
    --   desc = "Buffer backlinks",
    -- },
    { "<leader>os", "<cmd>ObsidianSearch<cr>" },
    {
      "<leader>og",
      "<cmd>ObsidianQuickSwitch<cr>",
      desc = "Goto link",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    notes_subdir = "quick-notes",
    open_notes_in = "current",
    completion = {
      nvim_cmp = true,
    },

    dir = "/Users/alex.belost/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "daily-notes",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%d-%m-%Y",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%d %B %Y",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "daily-note",
    },

    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      local filename = string.lower(spec.title):gsub("%s", "-")
      local path = spec.dir / tostring(filename)

      return path:with_suffix(".md")
    end,

    -- Optional, alternatively you can customize the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      local out = {}

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,

    disable_frontmatter = false,

    templates = {
      subdir = "_templates",
      date_format = "%d %B %Y",
      time_format = "%H:%M",
    },

    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
  },
}
