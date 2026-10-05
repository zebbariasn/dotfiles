-- Active profile, picked from NVIM_APPNAME:
--   nvim        -> web (default)
--   nvim-dotnet -> dotnet
-- Each profile lives in lua/zebb/profiles/<name>/ with an init.lua (tool lists)
-- and an optional plugins/ folder (extra lazy.nvim specs).

local appname = vim.env.NVIM_APPNAME or "nvim"
local name = appname:match("^nvim%-(.+)$") or "web"

local ok, spec = pcall(require, "zebb.profiles." .. name)
if not ok then
  vim.notify("Profile '" .. name .. "' not found, using defaults", vim.log.levels.WARN)
  spec = {}
end

local M = {
  name = name,
  lsp = spec.lsp or {},
  tools = spec.tools or {},
  parsers = spec.parsers or {},
  formatters = spec.formatters or {},
  linters = spec.linters or {},
}

local plugins_dir = vim.fn.stdpath("config") .. "/lua/zebb/profiles/" .. name .. "/plugins"
M.plugins = vim.fn.isdirectory(plugins_dir) == 1 and ("zebb.profiles." .. name .. ".plugins") or nil

return M
