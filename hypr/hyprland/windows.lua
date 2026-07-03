-- Opacity

hl.window_rule({
    match = {
        fullscreen = false
    },
    name = "opacity",
    opacity = WindowOpacity
})

-- Picture in picture

hl.window_rule({
    match = {
        title = "Picture.?in.?[Pp]icture"
    },
    move = { "(monitor_w-window_w-16)", "(monitor_h-window_h-16)" },
    size = "768 432",
    keep_aspect_ratio = true,
    float = true,
    pin = true,
    border_size = 0
})

-- Floats

local float_classes = {
    "guifetch",
    "yad",
    "zenity",
    "wev",
    "org\\.gnome\\.FileRoller",
    "file-roller",
    "blueman-manager",
    "com\\.github\\.GradienceTeam\\.Gradience",
    "feh", "imv",
    "system-config-printer",
    "org\\.quickshell"
}

hl.window_rule({
    match = {
        class = table.concat(float_classes, "|")
    },
    float = true
})

local dialogs = {
    "Zed — Settings",
    "(Select|Open)( a)? (File|Folder)(s)?",
    "File (Operation|Upload)( Progress)?",
    "Save [aA]s",
    "Update"
}
hl.window_rule({
    match = {
        title = table.concat(dialogs, "|")
    },
    float = true,
    center = true
})

-- Custom system update program
hl.window_rule({
    match = {
        title = "installupdates"
    },
    float = true,
    pin = true,
    size = {"(monitor_w*0.4)", "(monitor_h*0.4)"}
})