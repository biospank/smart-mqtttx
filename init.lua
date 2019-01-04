--init.lua

gpio.mode(4, gpio.OUTPUT)
gpio.write(4, gpio.HIGH)
cnt = 0

print("Starting SmartTx...")
print("Connecting to wifi...")

local tick = tmr.create()

tick:alarm(2000, tmr.ALARM_AUTO, function()
  if wifi.sta.getip() == nil then
    cnt = cnt + 1
    print(cnt .. " attempt...") -- waiting for ip
    if cnt == 5 then
      tick:stop()
      print("Entering wifi setup...")
      dofile("wifisetup.lua")
    end
  else
    tick:stop()
    print("Connected to wifi as: " .. wifi.sta.getip())
    dofile("mqttpub.lua") -- send request to mqtt provider
  end
end)
