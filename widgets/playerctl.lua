local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local update_interval = 1

local art = wibox.widget {
    image = gears.filesystem.get_configuration_dir() .. "icons/music.png",
    resize = true,
    forced_height = dpi(150),
    forced_width = dpi(150),
    clip_shape = helpers.rrect(15),
    halign = "center",
    widget = wibox.widget.imagebox
}

local create_button = function(symbol, color, command, playpause)

    local icon = wibox.widget {
        markup = helpers.colorize_text(symbol, color),
        font = "Font Awesome 5 Free 20",
        align = "center",
        valigin = "center",
        widget = wibox.widget.textbox()
    }

    local button = wibox.widget {
        icon,
        forced_height = dpi(30),
        forced_width = dpi(30),
        widget = wibox.container.background
    }

    awful.widget.watch("playerctl -a status", update_interval,
                       function(widget, stdout)
        if playpause then
            if stdout:find("Playing") then
                widget.markup = helpers.colorize_text("", color)
            else
                widget.markup = helpers.colorize_text("", color)
            end
        end
    end, icon)

    button:buttons(gears.table.join(
                       awful.button({}, 1, function() command() end)))

    button:connect_signal("mouse::enter", function()
        icon.markup = helpers.colorize_text(icon.text, beautiful.xforeground)
    end)

    button:connect_signal("mouse::leave", function()
        icon.markup = helpers.colorize_text(icon.text, color)
    end)

    return button

end

local title_widget = wibox.widget {
    markup = 'This <i>is</i> a <b>textbox</b>!!!',
    font = "Consolas Bold 16",
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local art_script = [[
bash -c '
tmp_dir="/tmp/awesomewm/spotify/"
tmp_cover_path=${tmp_dir}"cover.png"
if [ ! -d $tmp_dir  ]; then
    mkdir -p $tmp_dir
fi
link="$(playerctl metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')"
curl -s "$link" --output $tmp_cover_path
echo $tmp_cover_path
']]

local song_title_cmd = "playerctl metadata title"
local song_title = "rice is cringe"

awful.widget.watch(song_title_cmd, update_interval, function(widget, stdout)
    if not (song_title == stdout) then
        awful.spawn.easy_async_with_shell(art_script, function(out)
            local album_path = out:gsub('%\n', '')
            widget:set_image(gears.surface.load_uncached(album_path))
        end)
        song_title = stdout
    end

    title_widget:set_markup_silently(
        '<span foreground="' .. "#878787" .. '">' .. stdout .. '</span>')

end, art)

local play_command =
    function() awful.spawn.with_shell("playerctl play-pause") end
local prev_command = function() awful.spawn.with_shell("playerctl previous") end
local next_command = function() awful.spawn.with_shell("playerctl next") end

local spot_play_symbol = create_button("", color, play_command,
                                       true)

local spot_prev_symbol = create_button("", color, prev_command,
                                       false)
local spot_next_symbol = create_button("", color, next_command,
                                       false)

local spot = wibox.widget {
    {art, layout = wibox.layout.fixed.vertical},
    {
        {
            {
                {
                    nil,
                    {
                        step_function = wibox.container.scroll.step_functions
                            .waiting_nonlinear_back_and_forth,
                        speed = 75,
                        {
                            title_widget,
                            top = 25,
                            bottom = 5,
                            left = 10,
                            right = 10,
                            widget = wibox.container.margin
                        },
                        widget = wibox.container.scroll.horizontal
                    },
                    nil,
                    expand = "outside",
                    layout = wibox.layout.align.horizontal
                },
                left = 5,
                right = 5,
                widget = wibox.container.margin
            },
            {
                nil,
                {
                    spot_prev_symbol,
                    spot_play_symbol,
                    spot_next_symbol,
                    spacing = dpi(60),
                    layout = wibox.layout.fixed.horizontal
                },
                nil,
                expand = "none",
                layout = wibox.layout.align.horizontal
            },
            layout = wibox.layout.align.vertical
        },
        top = dpi(5),
        bottom = dpi(5),
        widget = wibox.container.margin
    },
    layout = wibox.layout.align.vertical
}

return spot