local awful = require("awful")
local gears = require("gears")

local function bind(globalkeys, clientkeys, clientbuttons)
  globalkeys = gears.table.join(globalkeys,
    awful.key({ }, "XF86AudioPlay", function () awful.util.spawn_with_shell("playerctl play-pause") end),
    awful.key({ }, "XF86AudioNext", function () awful.util.spawn_with_shell("playerctl next") end),
    awful.key({ }, "XF86AudioPrev", function () awful.util.spawn_with_shell("playerctl previous") end),
    awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn_with_shell("amixer -c 0 set Master 1dB+") end),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn_with_shell("amixer -c 0 set Master 1dB-") end),
    awful.key({ }, "XF86AudioMute", function () awful.util.spawn_with_shell("amixer -c 0 set Master toggle") end)
  )

  return globalkeys, clientkeys, clientbuttons
end

return {
  bind = bind
}