-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/configuring/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
require("monitors")

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
-- default-apps.lua returns a table; it is required directly by the files that use it (keybinds.lua)

-------------------
---- AUTOSTART ----
-------------------

require("autostart")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/configuring/core/environment-variables/

require("env-vars")

---------------------
---- PERMISSIONS ----
---------------------

-- See https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/configuring/core/config-options/

require("looks")


---------------
---- INPUT ----
---------------

-- https://wiki.hypr.land/configuring/core/config-options/#input

require("input")


---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/configuring/core/binds/

require("keybinds")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

require("window-rules")
require("workspace-rules")
