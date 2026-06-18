local require_all = require("require_all")
local paths = require("paths")

require("variables")
require("functions")
require("env")
require("input")
require("autostart")
require("looknfeel")

require_all.files(paths.config_home .. "/hypr/hyprland", "hyprland")
require_all.files(paths.config_home .. "/hypr/apps", "apps")