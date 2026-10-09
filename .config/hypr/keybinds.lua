local apps    = require("default-apps")
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/configuring/core/binds/ for more
hl.bind(mainMod .. " + Return",         hl.dsp.exec_cmd("uwsm app -- " .. apps.terminal))
hl.bind(mainMod .. " + Q",              hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q",      hl.dsp.window.kill())
hl.bind(mainMod .. " + M",              hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + E",              hl.dsp.exec_cmd("uwsm app -- " .. apps.fileManager))
hl.bind(mainMod .. " + T",              hl.dsp.window.float())
hl.bind(mainMod .. " + CTRL + Return",  hl.dsp.exec_cmd("uwsm app -- " .. apps.menu))
hl.bind(mainMod .. " + P",              hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",              hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F",              hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F",      hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Move windows in dir with mainMod + ALT + arrow keys
hl.bind(mainMod .. " + ALT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + ALT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + ALT + down",  hl.dsp.window.move({ direction = "down" }))

-- Resize windows with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -20, y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 20,  y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x = 0,   y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0,   y = 20,  relative = true }), { repeating = true })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Groups
hl.bind(mainMod .. " + G",            hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + G",    hl.dsp.group.next())
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ direction = "left",  group_aware = true }))
-- hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "right", group_aware = true }))
-- hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.move({ direction = "up",    group_aware = true }))
-- hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.move({ direction = "down",  group_aware = true }))
-- hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.move({ out_of_group = true }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",       hl.dsp.exec_cmd("playerctl next"),           { locked = true })
hl.bind("XF86AudioPause",      hl.dsp.exec_cmd("playerctl play-pause"),     { locked = true })
hl.bind("XF86AudioPlay",       hl.dsp.exec_cmd("playerctl play-pause"),     { locked = true })
hl.bind("XF86AudioPrev",       hl.dsp.exec_cmd("playerctl previous"),       { locked = true })
hl.bind("XF86AudioRandomPlay", hl.dsp.exec_cmd("playerctl shuffle toggle"), { locked = true })

-- cliphist
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

-- screenshot
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grimblast copy area"))

-- mute mic
hl.bind("XF86Launch5", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
