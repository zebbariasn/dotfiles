return {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "cs",
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
  config = function(plugin, opts)
    -- main config's install list, then C# on top
    local main = dofile(vim.fn.expand("~/.config/nvim/lua/zebb/plugins/treesitter.lua"))
    main.config(plugin, opts)
    require("nvim-treesitter").install({ "c_sharp" })
  end,
}
