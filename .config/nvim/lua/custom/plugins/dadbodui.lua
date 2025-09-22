return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    {
      "jacoatvatfree/vim-dadbod-completion", -- Use your fork
      ft = { "sql", "mysql", "plsql", "javascript", "mongo" },
      lazy = true,
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "javascript", "mongo" },
          callback = function()
            vim.bo.omnifunc = "vim_dadbod_completion#omni"
          end,
        })
      end,
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  config = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
