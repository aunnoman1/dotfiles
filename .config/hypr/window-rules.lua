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

    blur         = true,
    ignore_alpha = 0.1, -- don't blur the transparent area outside the rounded corners
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


-- --- Scratchpads (toggled with SUPER+S / SUPER+grave, see keybinds.lua) ---
hl.window_rule({
    name  = "scratch-term",
    match = { class = "^scratchterm$" },

    workspace = "special:term silent",
    float     = true,
    size      = { "monitor_w*0.6", "monitor_h*0.55" },
    center    = true,
})

hl.window_rule({
    name  = "scratch-notes",
    match = { class = "^scratchnotes$" },

    workspace = "special:notes silent",
    float     = true,
    size      = { "monitor_w*0.45", "monitor_h*0.7" },
    center    = true,
})

-- --- Utility windows open floating and centred ---
local floaters = {
    "^(org.pulseaudio.pavucontrol|pavucontrol)$",
    "^(nwg-look|qt6ct|qt5ct|kvantummanager)$",
    "^(xdg-desktop-portal-gtk)$",
    "^(hyprpolkitagent|org.hyprland.hyprpolkitagent)$",
    "^(proton.vpn.app.gtk|protonvpn-app)$",
    "^(blueman-manager)$",
    "^(com.gabm.satty)$",
}
for i, class in ipairs(floaters) do
    hl.window_rule({
        name  = "float-util-" .. i,
        match = { class = class },

        float  = true,
        size   = { "monitor_w*0.4", "monitor_h*0.5" },
        center = true,
    })
end

-- Thunar file-operation progress dialogs
hl.window_rule({
    name  = "float-thunar-progress",
    match = { class = "^thunar$", title = "^(File Operation Progress|Confirm to replace files)$" },

    float  = true,
    center = true,
})

-- Picture-in-Picture: small, pinned, bottom-right
hl.window_rule({
    name  = "pip",
    match = { title = "^(Picture-in-Picture|Picture in picture)$" },

    float             = true,
    pin               = true,
    size              = { "monitor_w*0.25", "monitor_h*0.25" },
    move              = { "monitor_w*0.75-20", "monitor_h*0.75-20" },
    keep_aspect_ratio = true,
})

-- Don't lock or blank the screen while a video player or game is fullscreen.
-- Browsers are deliberately left out: a fullscreen page left open would block idle forever
-- (Chrome still holds its own wake lock while a video is actually playing).
hl.window_rule({
    name  = "idle-inhibit-fullscreen",
    match = { class = "^(mpv|vlc|netflix|gamescope|steam_app_.*)$" },

    idle_inhibit = "fullscreen",
})

-- Frosted notifications and launcher
hl.layer_rule({ name = "mako-blur", match = { namespace = "notifications" }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ name = "wofi-blur", match = { namespace = "wofi" },          blur = true, ignore_alpha = 0.3 })
