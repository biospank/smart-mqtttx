# Smart-mqtttx

An adapted version of a brilliant smart button enginered by [Noel Portugal](https://www.hackster.io/noelportugal/ifttt-smart-button-e11841).
It uses an esp8266-01 Espressif wi-fi module and [lua programming language](https://www.lua.org/) to turn on, publish an mqtt message and shutdown to prevent battery drain.
It supports OTA wi-fi configuration.

## Installation

### 1. Flash [nodemcu](https://nodemcu-build.com/) firmware

    add `end user setup` and `MQTT` to the basic preselected modules.
    Download and flash using [esptool](https://github.com/espressif/esptool)

### 2. Fork this project


### 3. Upload files

    **Note**
    There are many `uploaders` out there, I use [nodemcu-uploader](https://github.com/kmpm/nodemcu-uploader)

    Make changes to `init.lua` to set your mqtt provider configuration and upload `init.lua`, `wifisetup.lua` and `mqttpub.lua` to the esp-01 module

    A `iftttrequest.lua` has been added to test IFTTT (not required)

## License

    [GPL3+](https://opensource.org/licenses/GPL-3.0)
