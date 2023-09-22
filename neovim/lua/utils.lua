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

function M.merge_opts(first_table, second_table)
  local merged_table = {}

  for k, v in pairs(first_table) do
    merged_table[k] = v
  end
  for k, v in pairs(second_table) do
    merged_table[k] = v
  end

  return merged_table
end

return M
