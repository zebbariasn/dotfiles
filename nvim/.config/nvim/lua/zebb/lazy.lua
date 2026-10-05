local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local profile = require("zebb.profile")

local spec = { { import = "zebb.plugins" }, { import = "zebb.plugins.lsp" } }
if profile.plugins then
  table.insert(spec, { import = profile.plugins })
end

require("lazy").setup(spec, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
