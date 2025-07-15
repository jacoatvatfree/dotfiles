return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    -- { "kristijanhusak/vim-dadbod-completion", ft = { "mongodb" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  config = function()
    -- your dbui configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
