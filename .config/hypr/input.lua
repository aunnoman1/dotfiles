-- https://wiki.hypr.land/configuring/core/config-options/#input
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 2,

        sensitivity = -0.35, -- -1.0 - 1.0, 0 means no modification.

        accel_profile = "flat",

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- https://wiki.hypr.land/configuring/core/binds/gestures/
-- hl.gesture({
--     fingers   = 3,
--     direction = "horizontal",
--     action    = "workspace",
-- })

-- Example per-device config
-- See https://wiki.hypr.land/configuring/core/devices/ for more
hl.device({
    name        = "logitech-gaming-mouse-g402",
    sensitivity = -0.3,
})
