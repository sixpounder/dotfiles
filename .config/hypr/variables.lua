-- ------ Hyprland ------
-- Apps
Terminal = "kitty"
Browser = "flatpak run app.zen_browser.zen"
Editor = "code"
FileExplorer = "nautilus"

-- Touchpad
TouchpadDisableTyping = true
TouchpadScrollFactor = 0.3
WorkspaceSwipeFingers = 4
GestureFingers = 3
GestureFingersMore = 4

-- Fonts
MonospaceFont = "Monaspace Argon NF"

-- Blur
BlurEnabled = true
BlurSpecialWs = true
BlurPopups = true
BlurInputMethods = true
BlurSize = 10
BlurPasses = 2
BlurXray = false

-- Shadow
ShadowEnabled = true
ShadowRange = 2
ShadowRenderPower = 3
ShadowColour = "rgba($surfaced4)"

-- Gaps
WorkspaceGaps = 10
WindowGapsIn = 6
WindowGapsOut = 12
SingleWindowGapsOut = 20

-- Window styling
WindowOpacity = 1.0
WindowInactiveOpacity = 0.8
WindowRounding = 8

WindowBorderSize = 1 -- waiting for noctalia integration for lua
ActiveWindowBorderColour = "rgba($primarye6)"
InactiveWindowBorderColour = "rgba($onSurfaceVariant11)"

-- Misc
VolumeStep = 5  -- In percent
CursorTheme = "Bibata-Modern-Ice"
CursorSize = 24
-- CursorTheme = rose-pine-hyprcursor
-- CursorSize = 32
IconTheme = "Gruvbox-Plus-Dark"


-- ------ Keybinds ------
-- Workspaces
KbMoveWinToWs = "Super+Alt"
KbMoveWinToWsGroup = "Ctrl+Super+Alt"
KbGoToWs = "Super"
KbGoToWsGroup = "Ctrl+Super"
KbToggleLayout = "Super, L"
KbNextWs = "Ctrl+Super, right"
KbPrevWs = "Ctrl+Super, left"
KbToggleSpecialWs = "Super, S"

-- Window groups
KbWindowGroupCycleNext = "Alt, Tab"
KbWindowGroupCyclePrev = "Shift+Alt, Tab"
KbUngroup = "Super, U"
KbToggleGroup = "Super, Comma"

-- Window actions
KbMoveWindow = "Super, Z"
KbResizeWindow = "Super, X"
KbWindowPip = "Super+Alt, Backslash"
KbPinWindow = "Super, P"
KbWindowFullscreen = "Super, F"
KbWindowBorderedFullscreen = "Super+Alt, F"
KbToggleWindowFloating = "Super+Alt, Space"
KbCloseWindow = "SUPER + Q"

-- Special workspace toggles
KbSystemMonitor = "Ctrl+Shift, Escape"
KbMusic = "Super, M"
KbCommunication = "Super, D"
KbTodo = "Super, R"

-- Apps
KbTerminal = "SUPER + Return"
KbBrowser = "SUPER + B"
KbEditor = "SUPER + C"
KbFileExplorer = "SUPER + E"

-- Misc
KbSession = "Ctrl+Alt, Delete"
KbShowNotifs = "Super, N"
KbClearNotifs = "Ctrl+Alt, C"
KbShowPanels = "Super, K"
KbLock = "Super, Escape"
KbRestoreLock = "Super+Alt, L"
