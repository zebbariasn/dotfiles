return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      red_dark = "#450404",
      red_mid = "#9c0909",
      red_bright = "#e96565",
      red_soft = "#cc7a7a",
      pink = "#e28585",
      fg = "#ded3d3",
      fg_dim = "#b89494",
      bg = "#121212",
      bg_mid = "#1e1e1e",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.red_mid, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg_mid, fg = colors.fg_dim },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      insert = {
        a = { bg = colors.red_soft, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg_mid, fg = colors.fg_dim },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      visual = {
        a = { bg = colors.red_bright, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg_mid, fg = colors.fg_dim },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      command = {
        a = { bg = colors.pink, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg_mid, fg = colors.fg_dim },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      replace = {
        a = { bg = colors.red_dark, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg_mid, fg = colors.fg_dim },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
      inactive = {
        a = { bg = colors.bg_mid, fg = colors.fg_dim, gui = "bold" },
        b = { bg = colors.bg_mid, fg = colors.fg_dim },
        c = { bg = colors.bg, fg = colors.fg_dim },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat", symbols = { unix = "" } },
          { "filetype" },
        },
      },
    })
  end,
}
