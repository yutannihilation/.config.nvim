-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    --
    -- filer
    --
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      opts = {
        extensions = { file_browser = { theme = "ivy", hijack_netrw = true } } 
      }
    },
    {
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      lazy = false,
    },
    { "nvim-telescope/telescope-project.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
    --
    -- UI
    --
    { "rebelot/kanagawa.nvim" },
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', opts = {} },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, 
    --
    -- LSP
    --
    { "neoclide/coc.nvim", branch = "release", build = "coc#util#install()" },
    --
    -- Yank history
    --
    { "gbprod/yanky.nvim", opts = {} },
    --
    -- other plugins
    --
    { import = "plugins" },
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "kanagawa" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

