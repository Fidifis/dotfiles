local options = require("configs.conform")
local unique_formatters = {}
local seen = {}

for _, formatters in pairs(options.formatters_by_ft) do
  for _, formatter in ipairs(formatters) do
    if not seen[formatter] and formatter ~= "trim_whitespace" then
      table.insert(unique_formatters, formatter)
      seen[formatter] = true
    end
  end
end

return unique_formatters
