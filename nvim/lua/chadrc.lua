-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  transparency = true,
}

M.ui = {
	theme = "tokyonight",

  hl_override = {
    NvDashAscii = { bg = "none", fg = "blue" },
    NvDashButtons = { bg = "black", fg = "blue" },
  },

	nvdash = {
		load_on_startup = true,
		header = require("configs.headers").hydra(),
    buttons = {
        { "  Find File", "Spc f f", "Telescope find_files" },
        { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
        { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
        { "  Plugins", "Lazy", "Lazy" },
        { "  Install LSPs", "Mason", "MasonInstallAll" },
        { "  Health", "", "checkhealth" },
      },
	},
}

return M
