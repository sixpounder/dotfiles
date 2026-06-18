-- Prevent focus loss on messages
hl.window_rule({
  match = {
    class = "org.telegram.desktop"
  },
  focus_on_activate = false,
  workspace = "special:communication"
})