--[[
Inspiration Engine Startup Script
(c)2020 Andrew Armstrong @backofficeshow

Consider this the IE version of autoexec.bat - basically if this
file exists in the root of the SD card, the system will run it.

If you do not want to run it for whatever reason, hold the ESC button
down on your IE on powerup.
]]
if ie.SDexists("win95.mp3") then
  ie.playmp3("win95.mp3")
end
ie.configTime()
local a = ie.getTime("%A, %B %d %Y %H:%M:%S")
ie.print(a)
ie.print("Ready to go!")

