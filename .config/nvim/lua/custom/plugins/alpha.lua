return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = {
    redraw_on_resize = false,
    noautocmd = true,
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function get_git_branch()
      local handle = io.popen("git branch --show-current 2>/dev/null")
      if handle then
        local branch = handle:read("*a"):gsub("\n", "")
        handle:close()
        if branch and branch ~= "" then
          return "  " .. branch
        end
      end
      return ""
    end

    local function get_git_repo_name()
      local handle = io.popen("git remote get-url origin 2>/dev/null")
      if handle then
        local url = handle:read("*a"):gsub("\n", "")
        handle:close()
        if url and url ~= "" then
          local repo_name = url:match("([^/]+)%.git$") or url:match("([^/]+)$")
          if repo_name then
            return repo_name:gsub("%.git$", "")
          end
        end
      end
      return nil
    end

    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC sf", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC sg", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    dashboard.section.footer.val = function()
      local git_repo = get_git_repo_name()
      local git_branch = get_git_branch()

      if git_repo and git_branch ~= "" then
        return "[ " .. git_repo:upper() .. " | " .. git_branch:gsub("^%s*", "") .. " ]"
      elseif git_repo then
        return "[ " .. git_repo:upper() .. " ]"
      else
        local current_dir = vim.fn.getcwd():match("[^/]*$"):upper()
        return "[ " .. current_dir .. " ]"
      end
    end

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
