return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
      },
    })
  end,
}
