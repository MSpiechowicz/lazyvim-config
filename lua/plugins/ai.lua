local function sidekick_desc(desc)
  return "Sidekick: " .. desc
end

local opencode_cmd = vim.fn.expand("~/.opencode/bin/opencode")
local default_ai_tool = "opencode"

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    opts = {
      filetypes = {
        markdown = true,
        help = true,
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            return false
          end
          return true
        end,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-j>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-r>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<C-l>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom",
          ratio = 0.4,
        },
      },
    },
  },
  {
    "folke/sidekick.nvim",
    event = "VeryLazy",
    opts = {
      nes = {
        enabled = false,
      },
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
          create = "terminal",
        },
        tools = {
          opencode = {
            cmd = { opencode_cmd },
          },
        },
      },
    },
    keys = {
      {
        "<Tab>",
        function()
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>"
          end
        end,
        mode = "n",
        expr = true,
        desc = sidekick_desc("Goto/apply next edit suggestion"),
      },
      {
        "<C-.>",
        function()
          require("sidekick.cli").focus()
        end,
        mode = { "n", "t", "i", "x" },
        desc = sidekick_desc("Focus CLI"),
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = sidekick_desc("Toggle CLI"),
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select({ name = default_ai_tool })
        end,
        desc = sidekick_desc("Select CLI"),
      },
      {
        "<leader>aD",
        function()
          require("sidekick.cli").close()
        end,
        desc = sidekick_desc("Detach CLI session"),
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}", name = default_ai_tool })
        end,
        mode = { "n", "x" },
        desc = sidekick_desc("Send this"),
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}", name = default_ai_tool })
        end,
        desc = sidekick_desc("Send file"),
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}", name = default_ai_tool })
        end,
        mode = "x",
        desc = sidekick_desc("Send selection"),
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").send({ msg = "{diagnostics}", name = default_ai_tool })
        end,
        desc = sidekick_desc("Send diagnostics"),
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt({ name = default_ai_tool })
        end,
        mode = { "n", "x" },
        desc = sidekick_desc("Select prompt"),
      },
      {
        "<leader>ao",
        function()
          require("sidekick.cli").toggle({ name = default_ai_tool, focus = true })
        end,
        desc = sidekick_desc("Toggle OpenCode"),
      },
    },
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}
      opts.keymap["<Tab>"] = {
        function()
          return require("sidekick").nes_jump_or_apply()
        end,
        "snippet_forward",
        "fallback",
      }
    end,
  },
}
