-- See https://wiki.hypr.land/configuring/core/rules/window-rules/ for more
-- See https://wiki.hypr.land/configuring/core/rules/workspace-rules/ for workspace rules

-- Example windowrule
-- hl.window_rule({ match = { class = "^(kitty)$", title = "^(kitty)$" }, float = true })

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name  = "windowrule-1",
    match = { class = ".*" },

    suppress_event = "maximize",
})


-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "windowrule-2",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Frosted glass for the waybar layer
hl.layer_rule({
    name  = "waybar-blur",
    match = { namespace = "waybar" },

    blur = true,
})


-- --- Stream Isolation Rules (Hyprland 0.54+) ---

-- Gamescope isolation
hl.window_rule({
    name  = "gamescope-steam",
    match = { class = "^gamescope$" },

    workspace        = "99 silent",
    no_focus         = true,
    no_initial_focus = true,
    fullscreen       = true,
    fullscreen_state = "3 3",
})
