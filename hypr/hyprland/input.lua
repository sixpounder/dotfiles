hl.config({
    input = {
        kb_layout = "it",
        numlock_by_default = false,
        repeat_delay = 250,
        repeat_rate = 35,
        focus_on_close = 1
    },
    cursor = {
        hotspot_padding = 1
    },
    binds = {
        scroll_event_delay = 0
    },
    gestures = {
        workspace_swipe_distance = 700,
        workspace_swipe_cancel_ratio = 0.15,
        workspace_swipe_min_speed_to_force = 5,
        workspace_swipe_direction_lock = true,
        workspace_swipe_direction_lock_threshold = 10,
        workspace_swipe_create_new = true
    }
})

hl.gesture({
    fingers = WorkspaceSwipeFingers,
    direction = "horizontal",
    action = "workspace"
})

hl.gesture({
    fingers = GestureFingers,
    direction = "up",
    special = true,
    action = "special"
})
