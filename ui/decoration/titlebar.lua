-- tb.lua
-- Regular Titlebars
local awful = require("awful")
local gears = require("gears")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local helpers = require("helpers")

local backg = beautiful.bg_second

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar

    local buttons = gears.table.join(awful.button({}, 1, function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        if c.maximized == true then c.maximized = false end
        awful.mouse.client.move(c)
    end), awful.button({}, 3, function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.resize(c)
    end))
    local borderbuttons = gears.table.join(
                              awful.button({}, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end), awful.button({}, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end))

        local close = awful.titlebar.widget.closebutton(c)
        local float = awful.titlebar.widget.floatingbutton(c)
        local maximize = awful.titlebar.widget.maximizedbutton(c)

    local title_bg = backg

    awful.titlebar(c, {
        position = "top",
        size = 30,
        bg = "#00000000"
    }):setup{
        {
            {
                {
                    {
                        layout = wibox.layout.fixed.horizontal,
                        {
                            layout = wibox.layout.fixed.horizontal,
                        },
                    },
		    {
                	{
                    		align  = 'center',
                    		widget = awful.titlebar.widget.titlewidget(c),
                	},
            		buttons = buttons,
            		layout  = wibox.layout.flex.horizontal
            	    },
		    
		    {
		    
                        wibox.layout.margin(maximize, 8, 6, 6, 6),
                        wibox.layout.margin(float, 8, 6, 6, 6), 
                        wibox.layout.margin(close, 8, 16, 6, 6), 
			layout= wibox.layout.fixed.horizontal,
		    },
                    layout = wibox.layout.align.horizontal
                },
                bg = title_bg,
		--buttons = buttons,
                shape = helpers.prrect(beautiful.border_radius, true, true,
                                       false, false),
                widget = wibox.container.background
            },
            top = 0,
            left = 0,
            right = 0,
            widget = wibox.container.margin
        },
        shape = helpers.prrect(beautiful.border_radius, true, true, false, false),
        widget = wibox.container.background

    }

    awful.titlebar(c, {
        position = "bottom",
        size =  20,
        bg = "#00000000"
    }):setup{
        {
            {
                {
                    nil,
                    nil,
                    {
                        {
                            {
                                layout = wibox.layout.fixed.horizontal
                            },
                            widget = wibox.container.margin
                        },
                        widget = wibox.container.margin
                    },
                    layout = wibox.layout.align.horizontal
                },
                bg = title_bg,
		buttons = buttons,
                shape = helpers.prrect(beautiful.border_radius, false, false,
                                       true, true),
                widget = wibox.container.background
            },

            bottom = 0,
            left = 0,
            right = 0,
            widget = wibox.container.margin
        },
        shape = helpers.prrect(beautiful.border_radius, false, false, true, true),
        widget = wibox.container.background

    }
end)
