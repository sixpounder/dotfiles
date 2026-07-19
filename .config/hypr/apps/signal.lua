-- Prevent focus loss on attention seekers
hl.window_rule({
  match = {
    class = "org.signal.Signal"
  },
  focus_on_activate = false,
  workspace = "special:communication"
})