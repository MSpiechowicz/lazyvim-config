return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
 ____  ____   __    ___  __  _  _  ____ 
(  __)(  _ \ /  \  / __)(  )/ )( \/ ___)
 ) _)  )   /(  O )( (_ \ )( ) \/ (\___ \
(__)  (__\_) \__/  \___/(__)\____/(____/
    ]]

    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
