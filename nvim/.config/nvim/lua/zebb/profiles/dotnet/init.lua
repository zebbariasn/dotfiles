-- C# / .NET profile: open with `NVIM_APPNAME=nvim-dotnet nvim`
-- Requires the .NET 10 runtime. The LSP (roslyn) is set up in ./plugins/roslyn.lua
return {
  lsp = {},
  tools = { "roslyn" }, -- from the Crashdummyy mason registry
  parsers = { "c_sharp", "xml" },
  formatters = {},
  linters = {},
}
