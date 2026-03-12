return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    priority = 1000,
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- Setup nvim-treesitter
      require("nvim-treesitter").setup({
        -- Directory to install parsers and queries to
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- Install parsers (this runs asynchronously)
      require("nvim-treesitter").install({
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "java",
      })

      -- Enable treesitter highlighting for supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function(event)
          local buf = event.buf
          local ft = vim.bo[buf].filetype
          
          -- List of filetypes to exclude (plugin UIs, etc.)
          local exclude_fts = {
            "alpha",
            "dashboard",
            "NvimTree",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
            "TelescopePrompt",
            "TelescopeResults",
            "noice",
            "oil",
          }
          
          -- Skip empty filetypes, special buffers, and excluded filetypes
          if ft == "" or vim.bo[buf].buftype ~= "" or vim.tbl_contains(exclude_fts, ft) then
            return
          end
          
          -- Get the treesitter language for this filetype
          local lang = vim.treesitter.language.get_lang(ft)
          if not lang then
            return
          end
          
          -- Try to start treesitter, ignore errors if parser doesn't exist
          pcall(vim.treesitter.start, buf)
        end,
      })
    end,
  },
}
