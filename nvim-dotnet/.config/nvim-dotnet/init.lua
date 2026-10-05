-- .NET profile: reuses the main config (~/.config/nvim) and layers C# tooling on top.
-- Launch with: NVIM_APPNAME=nvim-dotnet nvim
local main_config = vim.fn.expand("~/.config/nvim")
vim.opt.rtp:prepend(main_config)

require("zebb.core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
  { import = "zebb.plugins" },
  { import = "zebb.plugins.lsp" },
  { import = "dotnet.plugins" },
}, {
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  -- lazy resets rtp on setup; keep the main config so zebb.* modules stay resolvable
  performance = { rtp = { paths = { main_config } } },
})

require("zebb.lsp")
