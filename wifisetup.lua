-- wifisetup.lua

enduser_setup.start(
  function()
    print("Connection successful: " .. wifi.sta.getip())
    ssid, pwd, _bssid = wifi.sta.getconfig(false)

    print("Restarting device...")
    tmr.create():alarm(5000, tmr.ALARM_SINGLE, function()
      wifi.setmode(wifi.STATION);
      wifi.sta.config({ssid = ssid, pwd = pwd, save = true});
      node.restart()
    end)
  end,
  function(err, str)
    print("enduser_setup: Err #" .. err .. ": " .. str)
  end,
  print -- Lua print function can serve as the debug callback
);
