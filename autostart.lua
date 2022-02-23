local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")

local function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then findme = cmd:sub(0, firstspace - 1) end
  awful.spawn.with_shell(string.format(
                             'pgrep -u $USER -x %s > /dev/null || (%s)',
                             findme, cmd), false)
end

-- picom


awful.spawn.with_shell("picom")
awful.spawn.with_shell("xautolock -time 10 -locker " .. gfs.get_configuration_dir() .. "scripts/lock.sh") 

return autostart
