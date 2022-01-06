local awful = require('awful')
local conf = awful.util.getdir('config')
local icon = conf .. '/icons/'

local icons = {}

icons.png = {
   me = icon .. "profile.png",
   start = icon .. "start.png",
   startorb = icon .. "StartOrb.png",
   apps = icon .. "dock/app_drawer_alt.png",
   chrome = icon .. "dock/chrome.png",
   discord = icon .. "dock/discord2.png",
   file = icon .. "dock/files2.png",
   spotify = icon .. "dock/spotify.png",
   netflix = icon .. "dock/netflix.png",
   setting = icon .. "dock/settings.png",
   shutdown = icon .. "power/Shutdown.png",
   restart = icon .. "power/Restart.png",
   logoff = icon .. "power/Logoff.png",
   chevron = icon .. "buttons/button_chevron.png",
   pause = icon .. "buttons/button_pause.png",
   burst = icon .. "buttons/button_burst.png",
   screen = icon .. "buttons/button_rect.png",
   firefox = icon .. "dock/firefox-logo-nightly.png",
   steam = icon .. "dock/steam.png",
   music = icon .. "dock/music.png",
}

return icons
