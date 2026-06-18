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
    move = { "(monitor_w-window_w-24)", "(monitor_h-window_h-24)" },
    size = "768 432",
    keep_aspect_ratio = true,
    float = true,
    pin = true,
    border_size = 0
})

-- Noctalia elements

hl.layer_rule({
    name = "noctalia",
    match = {
        namespace = "noctalia-background-.*$"
    },
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true
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

local float_titles = {
    "Zed — Settings",
    "(Select|Open)( a)? (File|Folder)(s)?",
    "File (Operation|Upload)( Progress)?",
    "Save [aA]s",
    "Update"
}
hl.window_rule({
    match = {
        title = table.concat(float_titles, "|")
    },
    float = true
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