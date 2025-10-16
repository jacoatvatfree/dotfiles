return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",

  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "[N]ew Obsidian note", mode = "n" },
    { "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Search [O]bsidian notes", mode = "n" },
    { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick [S]witch", mode = "n" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of [B]acklinks", mode = "n" },
    { "<leader>oj", "<cmd>ObsidianToday<cr>G", desc = "Open today's [j]ournal", mode = "n" },
    { "<leader>oJ", "<cmd>ObsidianYesterday<cr>", desc = "Open yesterday's [J]ournal", mode = "n" },
    { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "[O]bsidian [T]emplates", mode = "n" },
    { "<leader>so", "<cmd>ObsidianSearch<cr>", desc = "[S]earch [O]bsidian Notes", mode = "n" },
  },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "Notes",
          path = "~/notes",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      new_notes_location = "current_dir",
      wiki_link_func = function(opts)
        if opts.id == nil then
          return string.format("[[%s]]", opts.label)
        elseif opts.label ~= opts.id then
          return string.format("[[%s|%s]]", opts.id, opts.label)
        else
          return string.format("[[%s]]", opts.id)
        end
      end,
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Journal",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },
      mappings = {
        -- "Obsidian follow"
        ["<leader>of"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true, desc = "[O]bsidian [F]ollow" },
        },
        -- Toggle check-boxes "obsidian done"
        ["<leader>od"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true, desc = "[O]bsidian [D]one" },
        },
        -- -- Create a new newsletter issue
        -- ["<leader>onn"] = {
        -- 	action = function()
        -- 		return require("obsidian").commands.new_note("Newsletter-Issue")
        -- 	end,
        -- 	opts = { buffer = true },
        -- },
        -- ["<leader>ont"] = {
        -- 	action = function()
        -- 		return require("obsidian").util.insert_template("Newsletter-Issue")
        -- 	end,
        -- 	opts = { buffer = true },
        -- },
      },

      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
        tags = "",
      },
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({ "open", url }) -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
      end,
    })
  end,
}
