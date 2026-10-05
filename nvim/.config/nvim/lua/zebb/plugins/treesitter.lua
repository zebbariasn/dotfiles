return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  init = function()
    -- the main branch no longer enables highlighting by itself;
    -- start it for any filetype whose parser is installed
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
  config = function()
    require("nvim-treesitter").install(vim.list_extend({
      "lua",
      "json",
      "yaml",
      "markdown",
      "markdown_inline",
      "bash",
      "sql",
      "vim",
      "vimdoc",
    }, require("zebb.profile").parsers))
  end,
}
