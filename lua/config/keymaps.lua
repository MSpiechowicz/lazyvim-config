-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Telescope
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- Terminal
vim.keymap.set(
  "n",
  "<leader>t",
  ":ToggleTerm<CR>",
  { noremap = true, silent = true, desc = "Toggle Terminal" }
)

-- CopilotChat
vim.keymap.set("n", "<leader>ccq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "CopilotChat - Quick Chat" })

vim.keymap.set("n", "h", "<Left>", { noremap = true, silent = true })
vim.keymap.set("n", "j", "<Down>", { noremap = true, silent = true })
vim.keymap.set("n", "k", "<Up>", { noremap = true, silent = true })
vim.keymap.set("n", "l", "<Right>", { noremap = true, silent = true })
