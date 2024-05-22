-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Language default settings
vim.api.nvim_exec("language en_US", true)

-- AutoFormat
vim.g.autoformat = false
