local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 主题：Neosolarized (带 Treesitter 支持)
  {
    "svrana/neosolarized.nvim",
    dependencies = { "tjdevries/colorbuddy.nvim" }
  },

  -- 状态栏与 UI
  { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
  { "akinsho/bufferline.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },

  -- 核心引擎：Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- 模糊搜索：Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", -- 稳妥起见，我们先锁定一个稳定版本
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "nvim-telescope/telescope-file-browser.nvim" },

  -- 实用工具
  { "windwp/nvim-autopairs", event = "InsertEnter" }, -- 仅在进入插入模式时加载
  { "norcalli/nvim-colorizer.lua" },
  { "keaising/im-select.nvim" },
})
