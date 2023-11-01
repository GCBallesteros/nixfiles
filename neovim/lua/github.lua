--- @class system.Results
--- @field code integer
--- @field stdout string
--- @field stderr string

--- @param cmd string|string[]
--- @return system.Results
local function system(cmd)
  local results = {}

  local function callback(_, data, event)
    if event == "exit" then
      results.code = data
    elseif event == "stdout" or event == "stderr" then
      results[event] = table.concat(data, "\n")
    end
  end

  vim.fn.jobwait({
    vim.fn.jobstart(cmd, {
      on_exit = callback,
      on_stdout = callback,
      on_stderr = callback,
      stdout_buffered = true,
      stderr_buffered = true,
    }),
  })

  return results
end

local M = {}

local function fetch_pr(pr_id)
  local pr_branch = "__pr-" .. pr_id
  local target_pr = "pull/" .. pr_id .. "/head:" .. pr_branch
  local results = system({ "git", "fetch", "origin", target_pr })

  if results.code ~= 0 then
    vim.notify(
      "Commit failed with the message: \n" .. vim.trim(results.stdout .. "\n" .. results.stderr),
      vim.log.levels.ERROR,
      { title = "Commit" }
    )
  else
    vim.notify("Fetched " .. pr_branch, vim.log.levels.INFO, { title = "Github" })
  end
end

M.check_pr = function()
  -- Check if we are on a repo
  local open_pr = system({ "gh", "pr", "list", "--json", "title,number,headRefName" })

  if open_pr.code ~= 0 then
    vim.notify(vim.trim(open_pr.stderr), vim.log.levels.ERROR, { title = "Github" })
    return
  end

  open_pr = vim.json.decode(open_pr.stdout)

  vim.ui.select(open_pr, {
    prompt = "Select a PR: ",
    format_item = function(item)
      return "#" .. item.number .. "  " .. item.title
    end,
  }, function(choice)
    fetch_pr(choice.number)
    local pr_branch = "__pr-" .. choice.number
    local pr_commit = system({ "git", "rev-parse", pr_branch }).stdout
    if choice ~= nil then
      vim.cmd("DiffviewOpen origin/Head..." .. pr_commit)
    end
  end)
end

vim.fn.sign_define("pr_comments", { text = "" })
-- vim.fn.sign_place(0, "gh", "pr_comments", "%", { lnum = 3 })

M.pr_comments = {}

M.add_pr_comment = function()
  vim.fn.sign_place(0, "gh", "pr_comments", "%", { lnum = 3 })
  M.pr_comments[#M.pr_comments + 1] = {diff_line = 3}
  print(vim.inspect(M.pr_comments))
end

function print_signs()
  local all_signs_2 = vim.fn.sign_getplaced("%", { group = "gh" })

  for _, v in ipairs(all_signs_2) do
    print(vim.inspect(v))
  end
end

-- botright split or split are the way to open the window
-- then create a hidden buffer associated with some line

return M
