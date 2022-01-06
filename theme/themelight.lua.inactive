local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require('gears.filesystem')
local themes_path = gfs.get_themes_dir()
local beautiful = require("beautiful")

local theme = {}

-- themes

theme.font          = "Roboto Mono Medium 14"

theme.dir = string.format('%s/.config/awesome/theme', os.getenv('HOME'))

theme.wallpaper     = gfs.get_configuration_dir() .. "wallpapers/bright.png"

theme.bg_normal     = "#f0deff"
theme.bg_focus      = "#9cd6ff"
theme.bg_widget     = "#f5f5f5"
theme.bg_second	    = "#FFFFFF"
theme.text_color    = "#9500ff"
theme.ansi          ="{'#00d5ff', '#ff00ff', '#009dff', '#c300ff', '#00ccff', '#9500ff', '#0077ff', '#6600ff'}"

theme.fg_normal     = "#00aaff"
theme.fg_focus     = "#ff00ff"

theme.useless_gap   = 15
theme.border_radius = 10
theme.sidebar_radius = 40

-- icon

theme.icon_font_name = "Roboto Mono Medium 14"

-- widget

theme.tasklist_bg_focus = "#f5f5f5"

-- notif

theme.notification_icon = gfs.get_configuration_dir() .. "icons/notifications/notification.png"

-- titlebar

theme.titlebar_close_button_normal = gfs.get_configuration_dir() .. "icons/titlebar/button_magenta.png"
theme.titlebar_close_button_focus  = gfs.get_configuration_dir() .. "icons/titlebar/button_magenta.png"
theme.titlebar_close_button_focus_hover = gfs.get_configuration_dir() .. "icons/titlebar/button_magenta_light.png"

theme.titlebar_floating_button_normal_inactive = gfs.get_configuration_dir() .. "icons/titlebar/button_purple.png"
theme.titlebar_floating_button_focus_inactive  = gfs.get_configuration_dir() .. "icons/titlebar/button_purple.png"
theme.titlebar_floating_button_normal_active = gfs.get_configuration_dir() .. "icons/titlebar/button_purple.png"
theme.titlebar_floating_button_focus_active  = gfs.get_configuration_dir() .. "icons/titlebar/button_purple.png"
theme.titlebar_floating_button_focus_active_hover  = gfs.get_configuration_dir() .. "icons/titlebar/button_purple_light.png"
theme.titlebar_floating_button_focus_inactive_hover  = gfs.get_configuration_dir() .. "icons/titlebar/button_purple_light.png"

theme.titlebar_minimize_button_normal = gfs.get_configuration_dir() .. "icons/titlebar/button_purple.png"
theme.titlebar_minimize_button_focus  = gfs.get_configuration_dir() .. "icons/titlebar/button_purple.png"
theme.titlebar_minimize_button_focus_hover  = gfs.get_configuration_dir() .. "icons/titlebar/button_purple_light.png"


theme.titlebar_maximized_button_normal_inactive = gfs.get_configuration_dir() .. "icons/titlebar/button_blue.png"
theme.titlebar_maximized_button_focus_inactive  = gfs.get_configuration_dir() .. "icons/titlebar/button_blue.png"
theme.titlebar_maximized_button_normal_active = gfs.get_configuration_dir() .. "icons/titlebar/button_blue.png"
theme.titlebar_maximized_button_focus_active  = gfs.get_configuration_dir() .. "icons/titlebar/button_blue.png"
theme.titlebar_maximized_button_focus_active_hover  = gfs.get_configuration_dir() .. "icons/titlebar/button_blue_light.png"
theme.titlebar_maximized_button_focus_inactive_hover  = gfs.get_configuration_dir() .. "icons/titlebar/button_blue_light.png"



theme.icon_theme = nil

return theme
