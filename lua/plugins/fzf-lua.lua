return {
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup({
        grep = {
          rg_opts = "--column --line-number --no-heading --color=always --smart-case --fixed-strings",
          no_esc = true,
        },
        live_grep = {
          rg_opts = "--column --line-number --no-heading --color=always --smart-case --fixed-strings",
          no_esc = true,
        },
      })
    end,
  },
}
