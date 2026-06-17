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