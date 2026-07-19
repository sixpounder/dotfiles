local home = os.getenv("HOME")

return {
    home = home,
    config_home = os.getenv("XDG_CONFIG_HOME") or (home .. "/.config"),
}