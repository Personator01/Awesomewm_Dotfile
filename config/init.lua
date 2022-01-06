local beautiful = require("beautiful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local awful = require("awful")

require("config.key")

if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    awful.spawn.with_shell("feh --bg-fill " .. wallpaper)
end
