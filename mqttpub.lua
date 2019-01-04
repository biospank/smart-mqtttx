-- mqttpub.lua

mqttBrokerClientId = node.chipid()
mqttBrokerHost = "<ip-address>"
mqttBrokerPort = 1883
mqttBrokerUsr = "<user>"
mqttBrokerPwd = "<password>"
mqttBrokerTopic = "/smartbutton/" .. mqttBrokerClientId .. "/alert"

mqttBroker = mqtt.Client(mqttBrokerClientId, 120, mqttBrokerUsr, mqttBrokerPwd)

mqttBroker:connect(mqttBrokerHost, mqttBrokerPort, 0, function(client)
  print ("Connected")

  client:publish(mqttBrokerTopic, "sos", 0, 0, function(client)
    print("Sent message to topic: " .. mqttBrokerTopic)

    print("Shutting down device...")
    -- shutdown!
    gpio.write(4, gpio.LOW)

    -- if running the button is still pressed
    tmr.create():alarm(2000, tmr.ALARM_SINGLE, function()
      print("Resetting device...")
      wifi.sta.clearconfig()
      node.restart()
    end)

  end)
end,
function(client, reason)
  print("Failed to connect: " .. reason)
end)

mqttBroker:close();
