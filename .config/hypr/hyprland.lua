local require_all = require("lua.require_all")
local paths = require("paths")

require("variables")
require("functions")
require("env")
require("input")
require("autostart")
require("looknfeel")

require_all.require_all_config("hypr/hyprland", "hypr.hyprland")
require_all.require_all_config("hypr/apps", "hypr.apps")

-- For Noctalia Color templates
require("noctalia").apply_theme()
