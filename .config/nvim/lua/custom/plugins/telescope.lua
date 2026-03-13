return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
            ["<C-g>"] = {
              function(p_bufnr)
                -- send results to quick fix list
                require("telescope.actions").send_to_qflist(p_bufnr)
                local qflist = vim.fn.getqflist()
                local paths = {}
                local hash = {}
                for k in pairs(qflist) do
                  local path = vim.fn.bufname(qflist[k]["bufnr"]) -- extract path from quick fix list
                  if not hash[path] then -- add to paths table, if not already appeared
                    paths[#paths + 1] = path
                    hash[path] = true -- remember existing paths
                  end
                end
                -- show search scope with message
                vim.notify("find in ...\n  " .. table.concat(paths, "\n  "))
                -- execute live_grep_args with search scope
                require("telescope").extensions.live_grep_args.live_grep_args({ search_dirs = paths })
              end,
              type = "action",
              opts = {
                nowait = true,
                silent = true,
                desc = "Live grep on results",
              },
            },
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local builtin = require("telescope.builtin")

    keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Fuzzy [S]earch [F]iles in cwd" })
    keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "Fuzzy [S]earch recently [O]pened files" })
    keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch [S]tring in cwd" })
    keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch [W]ord under cursor in cwd" })
    keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp Tags" })
    keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Search existing buffers" })
    keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })
    keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })
  end,
}
