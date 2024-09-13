-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "tokyonight",

  hl_override = {
    NvDashAscii = { bg = "NONE", fg = "blue" },
  },

	nvdash = {
		load_on_startup = true,
		header = require("configs.headers").hydra(),
	},
}

return M
