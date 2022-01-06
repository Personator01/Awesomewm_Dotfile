local gfs = require("gears.filesystem")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local icons = require('icons')
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local helpers = require("helpers")

require("awful.autofocus")

beautiful.init(gfs.get_configuration_dir() .. "theme/theme.lua")



local function format_progress_bar(bar)
    local w = wibox.widget {
        nil,
        {bar, layout = wibox.layout.fixed.horizontal},
        expand = "none",
        forced_width = 150,
        layout = wibox.layout.align.horizontal
    }
    return w
end

awful.screen.connect_for_each_screen(function(s)

    -- Taglist

    -- Set tags and default layout
    awful.tag({"1", "2", "3", "4", "5", "6"}, s,   awful.layout.suit.tile)
    
    local taglist_buttons = gears.table.join(
        awful.button({ }, 1, function(t) t:view_only() end),
        awful.button({ modkey }, 1, function(t)
                                  if client.focus then
                                      client.focus:move_to_tag(t)
                                  end
                              end),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, function(t)
                                  if client.focus then
                                      client.focus:toggle_tag(t)
                                  end
                              end)
    )
    
    taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {
            shape = gears.shape.rounded_rect
        },
        layout   = {
            spacing = 0,
            spacing_widget = {
                color = '#181e23',
                shape = gears.shape.rounded_rect,
                widget = wibox.widget.separator,
            },
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id = 'text_role',
                                widget = wibox.widget.textbox,
                            },
                            margins = 0,
                            widget = wibox.container.margin,
                        },
                        widget = wibox.container.background,
                    },
                    {
                        id     = 'index_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 7,
                right = 7,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background,
            -- Add support for hover colors and an index label
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:connect_signal('mouse::enter', function()
                    if #c3:clients() > 0 then
                        awesome.emit_signal("bling::tag_preview::update", c3)
                        awesome.emit_signal("bling::tag_preview::visibility", s, true)
                    end
    
                end)
                self:connect_signal('mouse::leave', function()
                    awesome.emit_signal("bling::tag_preview::visibility", s, false)
                    if self.has_backup then self.bg = self.backup end
                end)
            end,
            update_callback = function(self, c3, index, objects)
            end,
        },
        buttons = taglist_buttons
    }

    -- Clock

    local clock = wibox.widget.textclock(
        '<span> %a %b %d  %I:%M %p </span>', 5
    )

    -- Awesome Icon

    local start = wibox.widget {
        {widget = wibox.widget.imagebox, image = icons.png.startorb},
        layout = wibox.container.margin(start, 0, 0, 0),
    }

    start:buttons(gears.table.join(awful.button({ }, 1, function() sidebar_toggle()
    end)))

    -- Music

    --local music = require("widgets.playerctl_bar")
   
    local musiccontrol = wibox.widget{
            {
                    {
                            {
                        image = icons.png.chevron,
                        widget = wibox.widget.imagebox,
                        buttons = (gears.table.join(
                                awful.button({},1,nil,function()
                                awful.spawn("mpc prev")
                                end)
                        )),
                        resize = true,
                        },
                direction = 'east',
                widget = wibox.container.rotate
                },
                top = 5,
                bottom = 5,
                left = 10,
                right = 5,
                widget = wibox.container.margin
            },
            {
                    {


                        image = icons.png.pause,
                        buttons = (gears.table.join(
                        awful.button({},1,nil, function()
                        awful.spawn("mpc toggle")
                                end)
                                )),
                        resize = true,
                        widget = wibox.widget.imagebox
                    },
                    left = 10,
                    right = 10,
                    top = 5,
                    bottom = 5,
                    widget = wibox.container.margin
            },
	    {
                    {
                            {
                                image = icons.png.chevron,
                                buttons = (gears.table.join(
                                awful.button({}, 1, nil, function()
                                awful.spawn("mpc next")
                                end)
                                )),
                                resize = true,
                                widget = wibox.widget.imagebox
                },
                        direction = 'west',
                        widget = wibox.container.rotate
                    },
                    left = 5,
                    right = 10,
                    top = 5,
                    bottom = 5,
                    widget = wibox.container.margin
            },
            layout = wibox.layout.fixed.horizontal
    }



    -- Layout Switcher

   local layoutswitch = {
        {
                image = icons.png.screen,
                buttons = (gears.table.join(
                awful.button({}, 1, nil, function()
                        awful.layout.inc(1)
                end),
                awful.button({}, 3, nil, function()
                        awful.layout.inc(-1)
                end)
                )),
                resize = true,
                widget = wibox.widget.imagebox
        },
        top = 5,
        bottom = 5,
        left = 10,
        right = 5,
        widget = wibox.container.margin
   }

    -- Theme Switcher
   local themeswitch = {
	   {
		   image = icons.png.burst,
		   buttons = (gears.table.join(
		   awful.button({}, 1, nil, function()
			   awful.spawn.with_shell(gfs.get_configuration_dir() .. "theme/theme-switch.sh")
		   end)
		   )),
		   resize = true,
		   widget = wibox.widget.imagebox
	   },
	   top = 5,
	   bottom = 5,
	   left = 5,
	   right = 20,
	   widget = wibox.container.margin
   }

    -- Bar
    
    s.wibar = awful.wibar({
        width = s.geometry["width"] - 200,
        screen = s,
        height = 40,
        bg = "#0000000",
        widget = wibox.container.background(),
    })

    s.wibar.y = 10
    
    -- Add widgets
    s.wibar:setup {
        {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                --start,
		--wibox.layout.margin(layoutswitch, 10, 10, 5, 5),
                layoutswitch,
		themeswitch,
		taglist,
            },
            {
                --music,
                layout = wibox.layout.fixed.horizontal, 
            },
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
		wibox.layout.margin(musiccontrol, 10, 10, 0, 0),
                --wibox.layout.margin(volume, 12, 12, 16, 16), 
                wibox.layout.margin(clock, 0, 10, 0, 0),
            },
        },
        bg = beautiful.bg_second,
        shape = helpers.rrect(beautiful.border_radius),
        widget = wibox.container.background(),
    }
end)
