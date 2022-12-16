local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- THEMES
  use "ellisonleao/gruvbox.nvim" -- gruvbox
  use "tanvirtin/monokai.nvim" -- monokai
  use "LunarVim/darkplus.nvim" -- darkplus from chrismachine
  use "ayu-theme/ayu-vim" -- ayu mirage

  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "terrortylor/nvim-comment" -- Line comment toggler 
  -- use "Pocco81/AutoSave.nvim" -- Autosave file
  use "windwp/nvim-autopairs" -- Autopairs
  use "fedepujol/move.nvim" -- Move the lines
  use "norcalli/nvim-colorizer.lua" -- preview css colors as hexadecimals
  use "nvim-tree/nvim-web-devicons" -- icons for the file manager
  use "nvim-tree/nvim-tree.lua" -- nvim navigation menu sidebar
  use "nvim-lualine/lualine.nvim" -- lualine
  use "windwp/nvim-ts-autotag"
  use "nvim-telescope/telescope.nvim" -- telescope
  use 'nvim-treesitter/nvim-treesitter' -- treesitter
  use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

