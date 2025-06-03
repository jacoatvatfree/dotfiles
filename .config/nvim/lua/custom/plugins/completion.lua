return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    enabled = false,
  },
  {
    "github/copilot.vim",
    event = "VimEnter",
    keys = {
      { "<Tab>", "copilot#Accept()", { expr = true, silent = true, mode = "i" } },
      { "<S-Tab>", "copilot#Cancel()", { expr = true, silent = true, mode = "i" } },
    },
  },
}
