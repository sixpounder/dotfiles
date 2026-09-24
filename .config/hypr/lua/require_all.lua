local M = {}

local function shell_quote(value)
  assert(type(value) == "string", "expected a string")
  return "'" .. value:gsub("'", "'\\''") .. "'"
end

local function xdg_config_home()
  local config_home = os.getenv("XDG_CONFIG_HOME")

  if config_home and config_home ~= "" then
    return config_home
  end

  local home = assert(
    os.getenv("HOME"),
    "HOME is not set and XDG_CONFIG_HOME is not set"
  )

  return home .. "/.config"
end

local function join_path(...)
  local parts = { ... }
  local result = parts[1]

  for i = 2, #parts do
    result = result:gsub("/$", "") .. "/" .. parts[i]:gsub("^/", "")
  end

  return result
end

local function list_lua_files(dir)
  local quoted_dir = shell_quote(dir)

  local command = table.concat({
    "if [ ! -d ", quoted_dir, " ]; then exit 1; fi; ",
    "for file in ", quoted_dir, "/*.lua; do ",
    "  [ -f \"$file\" ] || continue; ",
    "  printf '%s\\n' \"${file##*/}\"; ",
    "done; ",
    "printf '__REQUIRE_ALL_SUCCESS__\\n'",
  })

  local handle, err = io.popen(command, "r")

  if not handle then
    error(("cannot enumerate module directory %q: %s")
      :format(dir, tostring(err)), 2)
  end

  local output = handle:read("*a")

  -- Some embedded Lua environments report "No child processes" from
  -- handle:close() even though the command ran successfully. The marker
  -- lets us verify the command independently.
  handle:close()

  local marker = "__REQUIRE_ALL_SUCCESS__"
  local marker_start = output:find(marker, 1, true)

  if not marker_start then
    error(("failed to enumerate module directory %q; shell output:\n%s")
      :format(dir, output), 2)
  end

  output = output:sub(1, marker_start - 1)

  local files = {}

  for filename in output:gmatch("[^\r\n]+") do
    if filename:match("%.lua$") then
      files[#files + 1] = filename
    end
  end

  table.sort(files)

  return files
end


function M.require_all(dir, module_prefix, options)
  options = options or {}

  local exclude = options.exclude or {}
  local loaded = {}

  for _, filename in ipairs(list_lua_files(dir)) do
    local name = filename:gsub("%.lua$", "")

    if not exclude[name] then
      local module_name = name

      if module_prefix and module_prefix ~= "" then
        module_name = module_prefix .. "." .. module_name
      end

      if options.reload then
        package.loaded[module_name] = nil
      end

      local ok, result = pcall(require, module_name)

      if not ok then
        error(("failed to require %q from %q:\n%s")
          :format(module_name, dir, tostring(result)), 2)
      end

      loaded[#loaded + 1] = module_name

      if options.on_load then
        options.on_load(module_name, result)
      end
    end
  end

  return loaded
end

function M.require_all_config(config_subdir, module_prefix, options)
  local config_home = xdg_config_home()
  local dir = join_path(config_home, config_subdir)

  -- Make require("hypr.modules.foo") resolve relative to XDG_CONFIG_HOME.
  --
  -- For example:
  --   module_prefix = "hypr.modules"
  --   module       = "hypr.modules.foo"
  --   path          = "$XDG_CONFIG_HOME/hypr/modules/foo.lua"
  package.path = table.concat({
    join_path(config_home, "?.lua"),
    join_path(config_home, "?/init.lua"),
    package.path,
  }, ";")

  return M.require_all(dir, module_prefix, options)
end

return M