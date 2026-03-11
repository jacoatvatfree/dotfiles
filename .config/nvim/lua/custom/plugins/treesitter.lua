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
      require("nvim-treesitter").setup({
        ensure_installed = {
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
        },
      })
    end,
  },
}
