local dpi = require('beautiful.xresources').apply_dpi
local wibox  = require('wibox')
local awful = require('awful')
local icons = require('icons')
local gears = require("gears")
local helpers = require("helpers")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")

beautiful.init(gfs.get_configuration_dir() .. "theme/theme.lua")

chrome = "firefox"
discord = "discord"
file = "thunar"
netflix = "google-chrome-stable https://www.netflix.com"
setting = "code"
spotify = "spotify"
firefox = "firefox"
steam = "steam"
music = gfs.get_configuration_dir() .. "scripts/music.sh"


awful.screen.connect_for_each_screen(function (scr)

   local h = 70
   local w = 600

   local dock = wibox{
      position = "bottom",
      height = h,
      width = w,
      screen = scr,
      ontop = false,
      type = dock,
      visible = true,
      bg = "#00000000",
   }
   dock.screen = scr
   dock.x = (scr.geometry["width"]/2) - w/2
   dock.y = scr.geometry["height"] - h	

   local function create_img_widget(image, apps)
      local widget = wibox.widget {
         image = image,
	 resize = true,
         widget = wibox.widget.imagebox()
      }
      widget:buttons(gears.table.join(awful.button({}, 1, function()
         awful.spawn.with_shell(apps)
     end)))
      return widget
   end
   
   local spotify = create_img_widget(icons.png.spotify, spotify)
   local chrome = create_img_widget(icons.png.chrome, chrome)
   local discord = create_img_widget(icons.png.discord, discord)
   local file = create_img_widget(icons.png.file, file)
   local netflix = create_img_widget(icons.png.netflix, netflix)
   local setting = create_img_widget(icons.png.setting, setting)
   local firefox = create_img_widget(icons.png.firefox, firefox)
   local steam = create_img_widget(icons.png.steam, steam)
   local music = create_img_widget(icons.png.music, music)


   dock : setup {
      {
        --spotify,
        --chrome,
        wibox.layout.margin(firefox,45,30,10,10),
        wibox.layout.margin(file, 30, 30, 10, 10),
	wibox.layout.margin(music, 30, 30, 10, 10),
	wibox.layout.margin(discord,30, 30, 10, 10),
	wibox.layout.margin(steam, 30, 30, 10, 10),
        --netflix,
        --setting,
        layout = wibox.layout.fixed.horizontal,
      },
    bg = beautiful.bg_second,
    shape = helpers.rrect(beautiful.border_radius * 2),
    widget = wibox.container.background(),
   }

end)
