return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "svelte",
      "graphql",
      "python",
      "lua",
      "json",
      "markdown",
      "markdown_inline",
      "bash",
      "vim",
      "vimdoc",
    })
  end,
}
