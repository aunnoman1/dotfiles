-- See https://wiki.hypr.land/configuring/core/autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
    -- hl.exec_cmd(terminal)
    -- hl.exec_cmd("nm-applet &")
    -- hl.exec_cmd("waybar & hyprpaper & firefox")
    -- hl.exec_cmd("uwsm app -- waybar")

    hl.exec_cmd("uwsm app --  wl-paste --type text --watch cliphist store")

    hl.exec_cmd("uwsm app --  wl-paste --type image --watch cliphist store")
end)
