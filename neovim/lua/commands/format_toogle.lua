-- https://github.com/ChristianChiarulli/nvim/blob/aded29fdf43f7cc6ef976e348be213063fc330b0/lua/user/lsp/handlers.lua
local M = {}

function M.enable_format_on_save()
  local format_on_save = vim.api.nvim_create_augroup("format_on_save", { clear = true })
  vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = "*", callback = vim.lsp.buf.formatting_sync, group = format_on_save }
  )
  vim.notify "Enabled format on save"
end

function M.disable_format_on_save()
  M.remove_augroup "format_on_save"
  vim.notify "Disabled format on save"
end

function M.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.api.nvim_create_user_command("ToggleAutoFormat", M.toggle_format_on_save, { nargs = 0 })
return M
