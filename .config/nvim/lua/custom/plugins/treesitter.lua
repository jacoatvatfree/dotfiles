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
      -- Install parsers
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
        "vue",
      })

      -- Enable treesitter highlighting for supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "json",
          "javascript",
          "typescript",
          "typescriptreact",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "svelte",
          "graphql",
          "bash",
          "sh",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "query",
          "c",
          "java",
          "vue",
        },
        callback = function()
          vim.treesitter.start()
        end,
      })

      -- Enable indentation
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "json",
          "javascript",
          "typescript",
          "typescriptreact",
          "yaml",
          "html",
          "css",
          "lua",
          "bash",
          "sh",
        },
        callback = function()
          vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
        end,
      })

      -- Configure nvim-ts-autotag
      require("nvim-ts-autotag").setup()
    end,
  },
}
