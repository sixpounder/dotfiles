local noctalia_ipc = "qs -c noctalia-shell ipc call"
local function noctalia_ipc_command(cmd)
    return function()
        hl.dispatch(hl.dsp.exec_raw(noctalia_ipc .. " " .. cmd))
    end
end

-- Core (noctalia shell)
hl.bind("SUPER + Space", noctalia_ipc_command("launcher toggle"), { description = "Launcher" })
hl.bind("SUPER + S", noctalia_ipc_command("controlCenter toggle"), { description = "Control center" })
hl.bind("SUPER + comma", noctalia_ipc_command("settings toggle"), {description = "Settings" })
hl.bind("SUPER + Escape", noctalia_ipc_command("lockScreen lock"), { description = "Lock screen" })
hl.bind("SUPER + M", noctalia_ipc_command("launcher emoji"), { description = "Lock screen" })
hl.bind("SUPER + ALT + Space", noctalia_ipc_command("wallpaper toggle"), { description = "Wallpaper selector" })
hl.bind("CTRL + ALT + C", noctalia_ipc_command("notifications clear"), { description = "Clear notifications" })

-- Mouse bindings
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })    -- ALT + LMB: Move a window
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })  -- ALT + RMB: Resize a window

-- Apps
hl.bind(KbFileExplorer, hl.dsp.exec_cmd(FileExplorer), { description = "File explorer" })
hl.bind(KbTerminal, hl.dsp.exec_cmd(Terminal), { description = "Terminal" })
hl.bind(KbBrowser, hl.dsp.exec_cmd(Browser), { description = "Browser" })
hl.bind(KbEditor, hl.dsp.exec_cmd(Editor), { description = "Editor" })

-- Screenshot
hl.bind("PRINT", hl.dsp.exec_cmd("if area=$(slurp); then grim -g \"$area\" - | tee >(wl-copy) > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png && dunstify --app-name Screenshot \"Screenshot copied to clipboard\" -t 1000; fi"))

-- Tiling
hl.bind(KbCloseWindow, hl.dsp.window.close(), { description = "Close window" })

hl.bind("SUPER + J", hl.dsp.layout("togglesplit"), { description = "Toggle window split" })
hl.bind("SUPER + P", hl.dsp.window.pseudo(), { description = "Pseudo window" })
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle window floating/tiling" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), { description = "Full screen" })
hl.bind("SUPER + CTRL + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }), { description = "Tiled full screen" })
hl.bind("SUPER + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "Full width" })
hl.bind("SUPER + L", hl.dsp.exec_cmd("/home/sixpounder/.local/bin/omarchy-hyprland-workspace-layout-toggle"), { description = "Toggle workspace layout" })

hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "l" }), { description = "Focus on left window" })
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "r" }), { description = "Focus on right window" })
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "u" }), { description = "Focus on above window" })
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "d" }), { description = "Focus on below window" })

for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = tostring(workspace) }), { description = "Switch to workspace " .. workspace })
  hl.bind("SUPER + ALT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace) }), { description = "Move window to workspace " .. workspace })
  hl.bind("SUPER + SHIFT + ALT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace), follow = false }), { description = "Move window silently to workspace " .. workspace })
end

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Toggle scratchpad" })
hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), { description = "Move window to scratchpad" })

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })
hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })
hl.bind("SUPER + CTRL + TAB", hl.dsp.focus({ workspace = "previous" }), { description = "Former workspace" })

hl.bind("SUPER + SHIFT + ALT + LEFT", hl.dsp.workspace.move({ monitor = "l" }), { description = "Move workspace to left monitor" })
hl.bind("SUPER + SHIFT + ALT + RIGHT", hl.dsp.workspace.move({ monitor = "r" }), { description = "Move workspace to right monitor" })
hl.bind("SUPER + SHIFT + ALT + UP", hl.dsp.workspace.move({ monitor = "u" }), { description = "Move workspace to up monitor" })
hl.bind("SUPER + SHIFT + ALT + DOWN", hl.dsp.workspace.move({ monitor = "d" }), { description = "Move workspace to down monitor" })

hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.swap({ direction = "l" }), { description = "Swap window to the left" })
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "r" }), { description = "Swap window to the right" })
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.swap({ direction = "u" }), { description = "Swap window up" })
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.swap({ direction = "d" }), { description = "Swap window down" })

hl.bind("ALT + TAB", hl.dsp.window.cycle_next(), { description = "Focus on next window" })
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ next = false }), { description = "Focus on previous window" })
hl.bind("ALT + TAB", hl.dsp.window.bring_to_top(), { description = "Reveal active window on top" })
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.bring_to_top(), { description = "Reveal active window on top" })

hl.bind("CTRL + ALT + TAB", hl.dsp.focus({ monitor = "+1" }), { description = "Focus on next monitor" })
hl.bind("CTRL + ALT + SHIFT + TAB", hl.dsp.focus({ monitor = "-1" }), { description = "Focus on previous monitor" })

hl.bind("SUPER + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Expand window left" })
hl.bind("SUPER + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { description = "Shrink window left" })
hl.bind("SUPER + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { description = "Shrink window up" })
hl.bind("SUPER + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { description = "Expand window down" })

hl.bind("SUPER + ALT + code:20", hl.dsp.window.resize({ x = -25, y = 0, relative = true }), { description = "Expand window left a little" })
hl.bind("SUPER + ALT + code:21", hl.dsp.window.resize({ x = 25, y = 0, relative = true }), { description = "Shrink window left a little" })
hl.bind("SUPER + SHIFT + ALT + code:20", hl.dsp.window.resize({ x = 0, y = -25, relative = true }), { description = "Shrink window up a little" })
hl.bind("SUPER + SHIFT + ALT + code:21", hl.dsp.window.resize({ x = 0, y = 25, relative = true }), { description = "Expand window down a little" })

hl.bind("SUPER + CTRL + code:20", hl.dsp.window.resize({ x = -300, y = 0, relative = true }), { description = "Expand window left a lot" })
hl.bind("SUPER + CTRL + code:21", hl.dsp.window.resize({ x = 300, y = 0, relative = true }), { description = "Shrink window left a lot" })
hl.bind("SUPER + CTRL + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -300, relative = true }), { description = "Shrink window up a lot" })
hl.bind("SUPER + CTRL + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 300, relative = true }), { description = "Expand window down a lot" })

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll active workspace forward" })
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll active workspace backward" })

hl.bind("SUPER + G", hl.dsp.group.toggle(), { description = "Toggle window grouping" })
hl.bind("SUPER + ALT + G", hl.dsp.window.move({ out_of_group = true }), { description = "Move active window out of group" })

hl.bind("SUPER + ALT + LEFT", hl.dsp.window.move({ into_group = "l" }), { description = "Move window to group on left" })
hl.bind("SUPER + ALT + RIGHT", hl.dsp.window.move({ into_group = "r" }), { description = "Move window to group on right" })
hl.bind("SUPER + ALT + UP", hl.dsp.window.move({ into_group = "u" }), { description = "Move window to group on top" })
hl.bind("SUPER + ALT + DOWN", hl.dsp.window.move({ into_group = "d" }), { description = "Move window to group on bottom" })

hl.bind("SUPER + ALT + TAB", hl.dsp.group.next(), { description = "Next window in group" })
hl.bind("SUPER + ALT + SHIFT + TAB", hl.dsp.group.prev(), { description = "Previous window in group" })

hl.bind("SUPER + CTRL + LEFT", hl.dsp.group.prev(), { description = "Move grouped window focus left" })
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.group.next(), { description = "Move grouped window focus right" })

hl.bind("SUPER + ALT + mouse_down", hl.dsp.group.next(), { description = "Next window in group" })
hl.bind("SUPER + ALT + mouse_up", hl.dsp.group.prev(), { description = "Previous window in group" })

for index = 1, 5 do
  hl.bind("SUPER + ALT + code:" .. tostring(index + 9), hl.dsp.group.active({ index = index }), { description = "Switch to group window " .. index })
end

-- Volume, brightness, keyboard backlight, and touchpad controls.
hl.bind("XF86AudioRaiseVolume", noctalia_ipc_command("volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", noctalia_ipc_command("volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", noctalia_ipc_command("volume muteOutput"), { locked = true })
hl.bind("XF86AudioMicMute", noctalia_ipc_command("volume muteInput"), { locked = true, repeating = true, description = "Mute microphone" })
hl.bind("XF86MonBrightnessUp", noctalia_ipc_command("brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", noctalia_ipc_command("brightness decrease"), { locked = true, repeating = true })

-- Media controls.
hl.bind("XF86AudioNext", noctalia_ipc_command("media next"), { locked = true, description = "Next track" })
hl.bind("XF86AudioPause", noctalia_ipc_command("media pause"), { locked = true, description = "Pause" })
hl.bind("XF86AudioPlay", noctalia_ipc_command("media playPause"), { locked = true, description = "Play" })
hl.bind("XF86AudioPrev", noctalia_ipc_command("media previous"), { locked = true, description = "Previous track" })
