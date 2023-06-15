---@diagnostic disable: need-check-nil
local M = {}

function M.has_value(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

function M.split_string(str, sep)
  local values = {}
  for word in string.gmatch(str, "([^" .. sep .. "]+)") do
    table.insert(values, word)
  end
  return values
end

function M.getHostname()
  local f = io.popen "/bin/hostname"
  local hostname = f:read "*a" or ""
  f:close()
  hostname = string.gsub(hostname, "\n$", "")
  return hostname
end

return M
