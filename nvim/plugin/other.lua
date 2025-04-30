-- Set up lualine with Hatsune Miku theme
require("lualine").setup({
    icons_enabled = true,
    theme = 'hatsunemiku',
})

-- Set the colorscheme to Hatsune Miku
vim.cmd("colorscheme hatsunemiku")

-- Set up Comment plugin once
require("Comment").setup()

