return {
  "echasnovski/mini.comment",
  config = function()
    require("mini.comment").setup({
      mappings = {
        comment = "<Leader>c/",
        comment_line = "<Leader>c//",
        comment_visual = "<Leader>c/",
      },
    })
  end,
}
