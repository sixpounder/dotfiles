function parse_conf_variables(path)
  local fh = io.open(path, "r")
  if not fh then return nil, "cannot open "..path end
  local vars = {}
  for raw in fh:lines() do
    local line = raw:match("^%s*(.-)%s*$")            -- trim into a new local
    if line ~= "" and not line:match("^%s*#") then
      local name, val = line:match("^%$([%w_%-%.:]+)%s*=%s*(.+)$")
      if name then
        val = val:gsub('^"(.*)"$', "%1")             -- strip surrounding quotes
        -- perform ${var} substitutions (iteratively)
        local changed = true
        while changed do
          changed = false
          val = val:gsub("%${([%w_%-%.:]+)}", function(k)
            if vars[k] then changed = true; return vars[k] end
            return ""
          end)
        end
        vars[name] = val
      end
    end
  end
  fh:close()
  return vars
end