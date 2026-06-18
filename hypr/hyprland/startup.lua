-- ──────────────────────────────────────────────────────────────────────
--  Hyprland – Lua configuration
--  This file is a direct Lua translation of the original .conf snippet.
--  It follows the conventions described on the Hyprland wiki.
-- ──────────────────────────────────────────────────────────────────────

hl.on("hyprland.start", function()
    -- Environment for xdg-desktop-portal-hyprland
    hl.exec_cmd(
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    )

    -- Keyring and authentication agents
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    
    -- These are disabled because we use the noctalia polkit plugin.
    -- Currently there is no way (apparently) to query noctalia shell
    -- for a list of installed plugins, which appears to be in the next version (5).
    -- Once it is there, this should be enabled conditionally if the polkit plugin is
    -- not installed.

    -- Pick one
    -- hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    -- hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")   -- optional

    -- Clipboard history (text and image)
    hl.exec_cmd("wl-paste --type text  --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Auto‑delete trash that is 30 days old
    hl.exec_cmd("trash-empty 30")

    -- Cursor configuration
    hl.exec_cmd(string.format("hyprctl setcursor '%s' %s", CursorTheme, CursorSize))
    hl.exec_cmd(string.format("gsettings set org.gnome.desktop.interface cursor-theme '%s'", IconTheme))
    hl.exec_cmd(string.format("gsettings set org.gnome.desktop.interface cursor-size %s", CursorSize))

    -- Icon theme
    hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme " .. IconTheme)

    -- Location provider
    hl.exec_cmd("/usr/lib/geoclue-2.0/demos/agent")

    -- Load hyprsunset (dynamic colour temperature)
    hl.exec_cmd("hyprsunset")

    -- Forward Bluetooth media keys to MPRIS
    hl.exec_cmd("mpris-proxy")

    -- Start the user’s shell (or a custom launcher)
    hl.exec_cmd("qs -c noctalia-shell")
end)
