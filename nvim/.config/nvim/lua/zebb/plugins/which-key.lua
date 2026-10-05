return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
      { "<leader>c", group = "Code (LSP actions)" },
      { "<leader>e", group = "Explorer (file tree)" },
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>h", group = "Git hunks + Help" },
      { "<leader>l", group = "Lint / LazyGit" },
      { "<leader>m", group = "Format" },
      { "<leader>n", group = "No highlight" },
      { "<leader>q", group = "Database (dadbod)" },
      { "<leader>r", group = "Rename / Replace / Restart LSP" },
      { "<leader>s", group = "Splits (windows)" },
      { "<leader>t", group = "Tabs" },
      { "<leader>w", group = "Workspace sessions" },
      { "<leader>x", group = "Diagnostics (Trouble)" },
    },
  },
}
