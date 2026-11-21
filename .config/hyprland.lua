-- Hyprland Lua configuration
-- Converted from hyprland.conf
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/configuring/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/
--
--
-- [FOR SCREEN CAPTURE - because hdr and bitdepth + capture doesn't work]
hl.monitor({ output = "HDMI-A-1", mode = "3440x1440@100", position = "0x0", scale = 1.6 })

-- [FOR CODING]
-- for gigabyte monitor (21:9):
-- hl.monitor({ output = "HDMI-A-1", mode = "3440x1440@100", position = "0x0", scale = 1.6, bitdepth = 10, cm = "hdr", sdrbrightness = 1.1, sdrsaturation = 1.1 })

-- [FOR GAMING]
-- for gigabyte monitor (21:9) with HDR:
-- hl.monitor({ output = "HDMI-A-1", mode = "3440x1440@100", position = "0x0", scale = 1.0, bitdepth = 10, cm = "hdr", sdrbrightness = 1.2, sdrsaturation = 1.1 })

-- [FOR GAMING ON TV]
-- for TV with HDR:
-- hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@100", position = "0x0", scale = 1.0, bitdepth = 10, cm = "hdr", sdrbrightness = 1.2, sdrsaturation = 1.1 })

-- [FOR WORKING ON TV]
-- for TV without HDR:
-- hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@60", position = "0x0", scale = 2.67 })

-- [FOR QUEST 3]
-- for quest 3 with HDR:
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = 1.0, bitdepth = 10, cm = "hdr", sdrbrightness = 1.2, sdrsaturation = 1.1 })

---------------------
---- MY PROGRAMS ----
---------------------

-- See https://wiki.hypr.land/configuring/core/keywords/

-- Set programs that you use
local terminal = "kitty"
local fileManager = "thunar"
local menu = "wofi --show drun"
-- local browser  = "brave"
local browser = "flatpak run com.brave.Browser"
local calculator = "galculator"

-------------------
---- AUTOSTART ----
-------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

-- hl.exec_cmd(terminal)
hl.on("hyprland.start", function()
	hl.exec_cmd("blueman-applet & nm-applet")
	-- hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("pcloud")
	hl.exec_cmd("hex start")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	-- hl.exec_cmd("sleep 2 && steam -silent")
	-- hl.exec_cmd("lan-mouse --daemon")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/configuring/core/environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/configuring/core/config-options/

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 2,

		-- https://wiki.hypr.land/configuring/core/config-options/#variable-types for info about colors
		col = {
			-- lightblue
			active_border = "rgba(89bfddff)",
			-- very dark blue almost black
			inactive_border = "rgba(00020cff)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		-- The old conf used 0 here; the Lua API's minimum is 1. It has no
		-- effect while rounding is 0, so 1 preserves the intended look.
		rounding_power = 1,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)", -- default given shadow colour
		},

		-- https://wiki.hypr.land/configuring/core/config-options/#blur
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true, -- was: yes, please :)
	},
})

-- Default animations, see https://wiki.hypr.land/configuring/core/animations/

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/ for more
hl.config({
	dwindle = {
		-- pseudotile = true, -- Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/configuring/layouts/master-layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- https://wiki.hypr.land/configuring/core/config-options/#misc
hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---------------
---- INPUT ----
---------------

-- https://wiki.hypr.land/configuring/core/config-options/#input

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

-- https://wiki.hypr.land/configuring/core/config-options/#gestures
-- hl.gesture({
--     fingers = 3,
--     direction = "horizontal",
--     action = "workspace",
-- })

-- Example per-device config
-- See https://wiki.hypr.land/configuring/core/devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

-- Example binds, see https://wiki.hypr.land/configuring/core/binds/ for more

-- main modifier (alt / MOD1)
local mainMod = "ALT"

-- launch programs / core actions
hl.bind(mainMod .. " + q", hl.dsp.window.close())
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(
	mainMod .. " + n",
	hl.dsp.exec_cmd(terminal .. ' --directory "/home/adrian/pCloudDrive/pCloud Desktop/personal_coding/AutoTrader"')
)
hl.bind(
	mainMod .. " + m",
	hl.dsp.exec_cmd(terminal .. ' --directory "/home/adrian/pCloudDrive/pCloud Desktop/School/year4_semester1"')
)
hl.bind(mainMod .. " + d", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + r", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + g", hl.dsp.exec_cmd(calculator))
hl.bind(mainMod .. " + c", hl.dsp.exec_cmd("~/.config/hypr/screenshot.sh"))
hl.bind(mainMod .. " + SHIFT + w", hl.dsp.exec_cmd("~/.config/hypr/waybar_toggle.sh"))
hl.bind(mainMod .. " + w", hl.dsp.exec_cmd("~/.config/hypr/waybar_notification.sh"))
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + e", hl.dsp.exec_cmd("~/.config/hypr/power_menu_wofi.sh"))
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.exec_cmd("~/.config/hypr/center_floating.sh"))

-- hex
hl.bind("f9", hl.dsp.exec_cmd("hex dictation toggle"))
hl.bind("f10", hl.dsp.exec_cmd("hex paste-last"))

-- kokoro tts
hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd("/home/adrian/Documents/text_to_speech/bin/speak selection"))
hl.bind(mainMod .. " + SHIFT + o", hl.dsp.exec_cmd("/home/adrian/Documents/text_to_speech/bin/speak stop"))
hl.bind(mainMod .. " + SHIFT + n", hl.dsp.exec_cmd("/home/adrian/Documents/text_to_speech/bin/speak skip"))

-- sticky notes popup lauch key
hl.bind(mainMod .. " + s", hl.dsp.exec_cmd("~/.config/hypr/sticky/sticky.sh"))

-- move focus
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + semicolon", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "down" }))

-- move windows
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + semicolon", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "down" }))

-- resize windows
hl.bind(mainMod .. " + left", hl.dsp.window.resize({ x = -60, y = 0, relative = true })) -- shrink x
hl.bind(mainMod .. " + right", hl.dsp.window.resize({ x = 60, y = 0, relative = true })) -- grow x
hl.bind(mainMod .. " + up", hl.dsp.window.resize({ x = 0, y = -60, relative = true })) -- shrink y
hl.bind(mainMod .. " + down", hl.dsp.window.resize({ x = 0, y = 60, relative = true })) -- grow y

-- goto next workspace with alt + tab
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-------------------------------
---- WINDOWS AND WORKSPACES ----
-------------------------------

-- See https://wiki.hypr.land/configuring/core/rules/

-- prevent from floating
hl.window_rule({
	name = "windowrule-1",
	match = { class = "^(Brave-browser)$" },
	tile = true,
})

-- force to float with fixed size
hl.window_rule({
	name = "windowrule-2",
	match = { title = "^(sticky)$" },
	float = true,
	center = true,
	size = "800 600",
})

hl.window_rule({
	name = "windowrule-3",
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
	center = true,
	size = "800 600",
})

hl.window_rule({
	name = "windowrule-4",
	match = { class = "^(blueman-manager)$" },
	float = true,
	center = true,
	size = "800 600",
})

hl.window_rule({
	name = "windowrule-5",
	match = { class = "^(blueberry.py)$" },
	float = true,
	center = true,
	size = "800 600",
})

hl.window_rule({
	name = "windowrule-6",
	match = { class = "^(galculator)$" },
	float = true,
	center = true,
	size = "800 600",
})

hl.window_rule({
	name = "windowrule-7",
	match = { class = "^(nwg-look)$" },
	float = true,
	center = true,
	size = "800 600",
})

-- apply rounding to floating windows
-- the rounding_power=2 is set in decoration
hl.window_rule({
	name = "windowrule-8",
	match = { float = true },
	rounding = 6,
})

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
	name = "windowrule-9",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "windowrule-10",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- vtueb studio
hl.window_rule({
	name = "megumin-companion",
	match = { class = "^(steam_app_1325860)$" },
})
