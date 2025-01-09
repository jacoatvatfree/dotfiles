vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("v", "jk", "<ESC>", { desc = "Exit visual mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search [H]ighlights" })

keymap.set("n", "x", '"_x')

keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

keymap.set("i", "<Right>", "<C-O>l")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>bv", "<C-w>v", { desc = "Split [B]uffer [V]ertically" }) -- split window vertically
keymap.set("n", "<leader>bh", "<C-w>s", { desc = "Split [B]uffer [H]orizontally" }) -- split window horizontally
keymap.set("n", "<leader>be", "<C-w>=", { desc = "Make [B]uffer splits [E]qual size" }) -- make split windows equal width & height
keymap.set("n", "<leader>bx", "<cmd>close<CR>", { desc = "[B][X] Close current buffer split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[O]pen new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[X] Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to [N]ext tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to [P]revious tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current bu[F]fer in new tab" }) --  move current buffer to new tab

-- Oil
keymap.set("n", "<C-b>", "<CMD>Oil<CR>", { desc = "Open path to current file" })

-- B/E line beginning and end
keymap.set("n", "B", "^", { desc = "Move to [B]eginning of line" })
keymap.set("n", "E", "$", { desc = "Move to [E]nd of line" })

keymap.set("v", "B", "^", { desc = "Move to [B]eginning of line" })
keymap.set("v", "E", "$", { desc = "Move to [E]nd of line" })

-- ZenMode
keymap.set("n", "<leader>Z", "<cmd>ZenMode<cr>", { desc = "[Z]en Mode" })

-- Markdown Preview
keymap.set("n", "<leader>op", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown [P]review" })

-- Window resizing
keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Hide notifications
keymap.set("", "<Esc>", "<ESC>:noh<CR>:NoiceDismiss<CR>", { silent = true })

-- Show DBUI
keymap.set("n", "<leader>db", "<cmd>tabnew +DBUIToggle<cr>", { desc = "Toggle [D][B]UI" })

-- Window navigation
keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>", { desc = "Move to window below" })
keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>", { desc = "Move to window above" })
keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>", { desc = "Move to window left" })
keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>", { desc = "Move to window right" })

-- Close all
keymap.set("n", "<C-d>", "<cmd>qa<cr>", { desc = "Close all" })
keymap.set("v", "<C-d>", "<cmd>qa<cr>", { desc = "Close all" })
keymap.set("i", "<C-d>", "<cmd>qa<cr>", { desc = "Close all" })

-- Codeium
keymap.set("n", "<leader>cc", function()
  return vim.fn["codeium#Chat"]()
end, { desc = "[C]odeium [C]hat", expr = true, silent = true })
keymap.set("i", "<C-.>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })

-- Folding shortcut
keymap.set("n", "zz", "zA", { desc = "Toggle fold" })
