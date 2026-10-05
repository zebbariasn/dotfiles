return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- roslyn language server is published in a community registry
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "roslyn")
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = { "williamboman/mason.nvim" },
    opts = {},
  },
}
