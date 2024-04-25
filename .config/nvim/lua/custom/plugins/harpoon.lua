return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(paths, item.value)
        end

        return require("telescope.finders").new_table({
          results = paths,
        })
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = finder(),
          previewer = false,
          sorter = require("telescope.config").values.generic_sorter({}),
          layout_config = {
            height = 0.4,
            width = 0.5,
            prompt_position = "top",
            preview_cutoff = 120,
          },
          attach_mappings = function(prompt_bufnr, map)
            map("i", "<C-x>", function()
              local state = require("telescope.actions.state")
              local selected_entry = state.get_selected_entry()
              local current_picker = state.get_current_picker(prompt_bufnr)

              table.remove(harpoon_files.items, selected_entry.index)
              current_picker:refresh(finder())
            end)
            return true
          end,
        })
        :find()
    end

    local keymap = vim.keymap

    keymap.set("n", "<leader>pa", function()
      harpoon:list():add()
    end, { desc = "[A]dd file to harpoon" })
    keymap.set("n", "<leader>sp", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open har[P]oon menu with Telescope" })
    keymap.set("n", "<leader>pp", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open har[P]oon menu with Telescope" })
    keymap.set("n", "<leader>p1", function()
      harpoon:list():select(1)
    end, { desc = "Go to harpoon file [1]" })
    keymap.set("n", "<leader>p2", function()
      harpoon:list():select(2)
    end, { desc = "Go to harpoon file [2]" })
    keymap.set("n", "<leader>p3", function()
      harpoon:list():select(3)
    end, { desc = "Go to harpoon file [3]" })
    keymap.set("n", "<leader>p4", function()
      harpoon:list():select(4)
    end, { desc = "Go to harpoon file [4]" })
    keymap.set("n", "<leader>p5", function()
      harpoon:list():select(5)
    end, { desc = "Go to harpoon file [5]" })
    keymap.set("n", "<leader>pn", function()
      harpoon:list():next()
    end, { desc = "[N]ext harpoon file" })
    keymap.set("n", "<leader>pN", function()
      harpoon:list():prev()
    end, { desc = "[P]revious harpoon file" })
  end,
}
