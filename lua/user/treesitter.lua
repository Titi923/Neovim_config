require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "css", "javascript", "python", "lua" },
  highlight = {
    enable = true,
  },
} 

require('nvim-ts-autotag').setup()


-- vim.opt.termguicolors = true
-- require("bufferline").setup{}

