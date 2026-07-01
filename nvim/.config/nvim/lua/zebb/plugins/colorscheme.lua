return {
  "bjarneo/aether.nvim",
  branch = "v2",
  name = "aether",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = false,
    colors = {
      bg = "#121212",
      bg_dark = "#121212",
      bg_highlight = "#333333",
      fg = "#bebebe",
      fg_dark = "#8a8a8d",
      comment = "#8a8a8d",
      red = "#EE3333",
      orange = "#e68e0d",
      yellow = "#FFC107",
      green = "#f59e0b",
      cyan = "#FF4444",
      blue = "#D35F5F",
      purple = "#B91C1C",
      magenta = "#FF3333",
    },
  },
  config = function(_, opts)
    opts.on_highlights = function(hl, c)
      hl["@punctuation.bracket"] = { fg = c.orange }
      hl["@punctuation.delimiter"] = { fg = c.orange }
      hl["@markup.raw.markdown_inline"] = { bg = c.bg_highlight, fg = c.yellow }
      hl["VirtColumn80"] = { fg = "#6e4d1a" }
      hl["VirtColumn120"] = { fg = "#6e2222" }
    end
    require("aether").setup(opts)
    vim.cmd.colorscheme("aether")
  end,
}
