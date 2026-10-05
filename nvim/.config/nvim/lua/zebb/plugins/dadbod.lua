-- Databases: Postgres, MySQL, SQLite, SQL Server, Mongo, Redis...
-- Only loads when the UI is opened.
return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    -- shared by every profile, outside the repo (connection URLs can hold passwords)
    vim.g.db_ui_save_location = vim.fn.expand("~/.local/share/db_ui")

    -- table/column completion in SQL buffers
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("DadbodCompletion", { clear = true }),
      pattern = { "sql", "mysql", "plsql" },
      callback = function()
        require("cmp").setup.buffer({
          sources = {
            { name = "vim-dadbod-completion" },
            { name = "luasnip" },
            { name = "buffer" },
          },
        })
      end,
    })
  end,
  keys = {
    { "<leader>qq", "<cmd>DBUIToggle<CR>", desc = "Toggle database UI" },
    { "<leader>qa", "<cmd>DBUIAddConnection<CR>", desc = "Add database connection" },
    { "<leader>qf", "<cmd>DBUIFindBuffer<CR>", desc = "Find query buffer in DB UI" },
  },
}
