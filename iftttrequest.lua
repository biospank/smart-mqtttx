print("Sending to IFTTT")

http.get("http://maker.ifttt.com/trigger/button/with/key<your-ifttt-key>", nil, function(code, data)
  if (code < 0) then
    print("HTTP request failed")
  else
    print(code, data)
    print("IFTTT request sent. Goodbye")
    print("Shutting down device...")
    -- shutdown!
    gpio.write(4, gpio.LOW)

    tmr.create():alarm(2000, tmr.ALARM_SINGLE, function()
      print("Resetting device...")
      wifi.sta.clearconfig()
      node.restart()
    end)
  end
end)
