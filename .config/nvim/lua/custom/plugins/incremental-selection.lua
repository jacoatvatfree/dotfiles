return {
  "sustech-data/wildfire.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("wildfire").setup({
      surrounds = {
        { "(", ")" },
        { "{", "}" },
        { "<", ">" },
        { "[", "]" },
        { "'", "'" },
        { '"', '"' },
        { "`", "`" },
      },
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<TAB>",
        node_decremental = "<S-TAB>",
      },
    })
  end,
}
