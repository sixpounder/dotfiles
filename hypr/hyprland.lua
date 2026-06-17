--# Variables (colours + other vars)
-- exec = cp -L --no-preserve=mode --update=none $hypr/scheme/default.conf $hypr/scheme/current.conf
--source = $hypr/scheme/current.conf
--source = $hypr/variables.conf

-- Maybe create hyprland configs
-- exec = $hypr/scripts/configs.fish $cConf

--# User variables
--source = $cConf/hypr-vars.conf

require("variables")

-- # Default monitor conf
hl.monitor({
    output = "DP-2",
    mode = "highres",
    position = "0x0",
    scale = 1.25
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "highres",
    position = "auto",
    scale = 1
})

require('hyprland.env')
require('hyprland.workspaces')
require('hyprland.execs')
require('hyprland.input')
require('hyprland.keybinds')
require('hyprland.looknfeel')

-- # Configs
-- source = $hl/env.conf
-- source = $hl/general.conf
-- source = $hl/input.conf
-- source = $hl/misc.conf
-- source = $hl/animations.conf
-- source = $hl/decoration.conf
-- source = $hl/group.conf
-- source = $hl/execs.conf
-- source = $hl/rules.conf
-- source = $hl/gestures.conf
-- source = $hl/keybinds.conf
-- source = $hl/scrolling.conf
-- source = $hl/screen-sharing.conf
-- 
-- # User configs
-- source = $cConf/hypr-user.conf
