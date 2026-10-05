local profile = require("zebb.profile")

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- common servers + the active profile's (see lua/zebb/profiles/)
      ensure_installed = vim.list_extend({
        "lua_ls",
      }, profile.lsp),
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = vim.list_extend({
        "stylua", -- lua formatter
      }, profile.tools),
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
